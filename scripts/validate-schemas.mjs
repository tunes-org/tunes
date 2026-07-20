import { readFileSync, readdirSync, statSync } from "node:fs";
import { dirname, join, relative } from "node:path";
import { fileURLToPath } from "node:url";
import Ajv2020 from "ajv/dist/2020.js";
import addFormats from "ajv-formats";

const rootDir = join(dirname(fileURLToPath(import.meta.url)), "..");
const schemaDir = join(rootDir, "schemas/v0.1.0");
const examplesDir = join(rootDir, "examples/v0.1.0");

const ajv = new Ajv2020({ allErrors: true, strict: false });
addFormats(ajv);

const schemaFiles = readdirSync(schemaDir).filter((name) => name.endsWith(".schema.json"));

for (const file of schemaFiles) {
  const schemaPath = join(schemaDir, file);
  const schema = JSON.parse(readFileSync(schemaPath, "utf8"));
  ajv.addSchema(schema, schema.$id ?? file);
}

const exampleMappings = [
  {
    schemaId: "https://tunes.dev/schemas/v0.1.0/derived-upload-package.schema.json",
    glob: "uploads",
  },
  {
    schemaId: "https://tunes.dev/schemas/v0.1.0/consent-metadata.schema.json",
    glob: "consent",
  },
  {
    schemaId: "https://tunes.dev/schemas/v0.1.0/network-profile.schema.json",
    glob: "network-profiles",
  },
];

const collectJsonFiles = (dir) => {
  const entries = readdirSync(dir);
  const files = [];

  for (const entry of entries) {
    const fullPath = join(dir, entry);
    if (statSync(fullPath).isDirectory()) {
      files.push(...collectJsonFiles(fullPath));
      continue;
    }
    if (entry.endsWith(".json")) {
      files.push(fullPath);
    }
  }

  return files;
};

let failures = 0;

for (const mapping of exampleMappings) {
  const dir = join(examplesDir, mapping.glob);
  const validate = ajv.getSchema(mapping.schemaId);

  if (!validate) {
    console.error(`Missing schema: ${mapping.schemaId}`);
    failures += 1;
    continue;
  }

  for (const filePath of collectJsonFiles(dir)) {
    const data = JSON.parse(readFileSync(filePath, "utf8"));
    const valid = validate(data);

    if (valid) {
      console.log(`OK  ${relative(rootDir, filePath)}`);
      continue;
    }

    failures += 1;
    console.error(`FAIL ${relative(rootDir, filePath)}`);
    console.error(validate.errors);
  }
}

if (failures > 0) {
  process.exit(1);
}

console.log("All schema examples validated.");
