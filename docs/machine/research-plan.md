# Original research and implementation brief

> Historical source brief. Accepted ADRs, current architecture, schemas, governance, and legal canon are authoritative where they differ from this document.

TUNES

Transit User Noise Experience Survey

This describes both acoustic measurements and the experience of passengers. The name is connected naturally to sound while remaining broad enough to cover trains, metros and other transport systems internationally.

Your role

Act as the lead research strategist, scientific-methodology adviser, product architect and implementation planner for an open passenger rail-noise measurement project.

Do not immediately produce a generic app roadmap. First understand the scientific, civic, privacy, technical and user-experience requirements. Separate established facts, working assumptions, unresolved questions and decisions that require experimental evidence.

The output should be detailed enough that a small product-engineering team can use it to create a GitHub repository, conduct research, build prototypes, run a London pilot and publish a credible open dataset.

Project overview

The project will enable passengers to measure noise during ordinary railway journeys using consumer devices, initially iPhones.

It will probably begin on the London Underground, with routes such as the Central, Jubilee, Victoria and Northern lines providing useful initial coverage. The architecture and data model should not unnecessarily prevent later expansion to:

* London Overground
* Elizabeth line
* National Rail
* Other metro systems
* Railway systems in other cities and countries
* Android devices
* External microphones
* Wearable devices, subject to validation

The project has two related outputs:

1. A passenger-facing noise map and quieter-journey tool
2. An open measurement platform, methodology and dataset

The second may ultimately be more important than the first.

Intended public value

The project should help:

* Passengers compare the acoustic conditions of routes
* Parents plan journeys with young children
* Autistic, sensory-sensitive and neurodivergent passengers avoid distressing environments
* People with tinnitus, hyperacusis or hearing concerns make informed choices
* Researchers study real passenger exposure and perception
* Journalists and civic groups investigate railway noise
* Transport operators identify recurring passenger problems
* Public authorities prioritise interventions using real-world evidence
* Acoustic engineers compare professional measurements with large-scale passenger observations

Do not frame the project as replacing measurements performed by transport operators or acoustic professionals.

Its distinguishing value is repeated, passenger-generated evidence across:

* Times of day
* Passenger loads
* Train types
* Carriage positions
* Route sections
* Device models
* Seasonal conditions
* Maintenance states
* Ordinary passenger behaviour
* Subjective discomfort and perceived sound character

Core principles

The project must be:

* Open source
* Privacy-preserving
* Auditable
* Methodologically transparent
* Honest about uncertainty
* Accessible to non-specialists
* Useful to professional researchers
* Designed for ordinary commutes
* Offline-first during collection
* Resistant to false precision
* Versioned so historical data remains reproducible
* Expandable without prematurely designing for every country and transport mode

Important unresolved scope decisions

Investigate and provide recommendations on:

1. Whether the public project should initially cover only the London Underground or all London rail services
2. Whether the underlying schema should use Tube-specific concepts or generic railway concepts
3. Whether the first repository should combine app, web map, data processing and methodology
4. Whether raw audio should ever leave the device
5. Whether users should be able to contribute only derived acoustic features
6. How to distinguish research-grade, profiled and informal measurements
7. Whether Apple Watch, AirPods or other wearables offer useful measurement capabilities
8. Whether imported Voice Memos should be accepted as a lower-confidence contribution tier
9. How much route and carriage metadata users should enter manually
10. Whether subjective perception should be collected during or after a journey
11. Which outputs can responsibly be described as exposure, discomfort, loudness or acoustic risk
12. Which licences are appropriate for code, documentation and public data

Research programme

Create a structured research plan covering the following areas.

1. Citizen science and crowdsourced sensing

Study successful projects such as environmental monitoring, public mapping, biodiversity observation and community measurement initiatives.

Identify transferable practices concerning:

* Contributor trust
* Data validation
* Calibration
* Reputation systems
* Moderation
* Open licensing
* Governance
* Community motivation
* Handling disagreement
* Preventing fraudulent or low-quality submissions
* Communicating uncertainty
* Long-term dataset maintenance

2. Acoustic measurement methodology

Research the academically accepted approaches for measuring:

* Equivalent continuous sound level
* Maximum sound level
* Peak sound pressure
* A-weighted measurements
* C-weighted measurements
* Z-weighted measurements
* Time-weighted measurements
* Percentile levels
* One-third-octave or comparable frequency-band information
* Tonality
* Sharpness
* Roughness
* Fluctuation strength
* Impulsiveness
* Speech masking
* Vibration-related passenger experience
* Wheel squeal and tonal events

Review relevant IEC, ISO, British and occupational or environmental-noise guidance. Explain which standards apply directly, which are only informative, and which claims cannot be supported using uncalibrated consumer devices.

The methodology must avoid treating one decibel number as a complete description of passenger experience.

3. Consumer-device measurement limitations

Research iPhone microphone behaviour across supported models, including:

* Frequency response
* Input gain
* automatic gain control
* noise suppression
* voice-processing modes
* clipping
* microphone selection
* sample-rate behaviour
* orientation
* cases and obstructions
* differences between built-in microphones
* operating-system changes
* audio-session interruptions
* Bluetooth routing
* external microphone support

Do not assume Apple Watch or AirPods are superior measurement devices. Investigate:

* Available APIs
* Raw-audio access
* proprietary processing
* calibration consistency
* microphone placement
* battery and background restrictions
* synchronisation with the phone
* whether environmental-noise values exposed by the operating system can be exported or independently validated

Recommend experiments rather than relying on marketing claims.

4. Calibration and uncertainty

Develop a calibration hierarchy that may include:

* Unknown consumer device
* Device-model profile
* Individually field-calibrated device
* Device used beside a reference sound-level meter
* External calibrated microphone
* Professional survey equipment

Investigate whether overlapping crowdsourced measurements can improve estimates through population-level or hierarchical statistical calibration.

The proposal should distinguish:

* Absolute measurement accuracy
* Relative comparisons
* Repeatability
* Frequency-response correction
* Device-to-device variance
* Environmental variance
* User-placement variance
* Algorithmic uncertainty
* Route-inference uncertainty

Do not assume that a quiet-room check constitutes acoustic calibration. It can only help identify obstruction, unusual noise floor or malfunction.

5. Privacy and research ethics

Design a privacy model in which users retain control after recording.

The preferred flow is:

1. Record locally
2. Process locally where practical
3. Infer journey sections
4. Allow the user to review and correct them
5. Allow trimming or deletion
6. Show exactly what will be uploaded
7. Request explicit consent
8. Upload only the selected information

Research:

* The privacy implications of incidental conversations
* Whether raw audio is necessary
* Local extraction of acoustic features
* Retention and deletion policies
* Encryption
* Contributor pseudonymity
* Location-data minimisation
* Research ethics review
* Informed consent
* Children and vulnerable participants
* GDPR responsibilities
* Data-controller responsibilities
* Withdrawal of contributed data
* Public-data anonymisation
* Whether free-text reports create additional personal-data risk

Produce separate recommendations for:

* Derived acoustic features only
* Short audio excerpts
* Full raw audio
* Research-only restricted data

6. Railway and journey modelling

Design a network model capable of representing:

* Cities
* Transport systems
* Operators
* Lines
* Branches
* Directions
* Services
* Stations
* Platforms
* Station-to-station sections
* Track direction
* Train type
* Rolling stock
* Carriages
* Approximate carriage location
* Position within a carriage
* Planned and actual journey timing
* Service disruptions
* Express or skipped-stop services

The canonical unit of public comparison should probably be a station-to-station journey section, but test this assumption.

The schema should allow London-specific data without permanently encoding London-specific terminology into the core model.

7. Automatic journey alignment

Investigate how a recording can be aligned with railway sections using a combination of:

* User-selected route
* Starting station
* Intended destination
* Timetable expectations
* Station dwell patterns
* Door sounds
* Acceleration and braking
* Accelerometer data
* Vibration
* Acoustic-envelope changes
* Optional GPS where available
* Network topology
* Optional recognition of announcements
* Manual correction

Design a post-recording interface similar to editing subtitles or chapter markers.

The system predicts station boundaries. The user can drag the boundaries, stretch journey sections and correct station assignments.

Evaluate:

* Boundary-detection accuracy
* Branch ambiguity
* Delays and variable dwell times
* Trains held between stations
* Missed stops
* User joining after recording starts
* Recording stopping early
* Walking within stations
* Transfers between lines
* Loss of sensor data
* Background interruptions

8. Passenger and carriage metadata

Determine which information should be:

* Automatically inferred
* Selected before recording
* Added after recording
* Optional
* Required only for research campaigns

Potential metadata includes:

* Front, middle or rear of train
* Approximate carriage number
* Near carriage end, centre, doors or bogie
* Sitting or standing
* Phone in hand, pocket or bag
* Phone orientation
* Whether the microphone was obstructed
* Passenger crowding
* Estimated passenger load
* Windows or doors open where relevant
* Train type
* Rolling stock
* Time of day
* Weather where relevant
* Service disruption
* Whether the user wore headphones
* Subjective discomfort

Avoid creating a form so demanding that ordinary passengers stop contributing.

9. Subjective passenger experience

Design an optional perception survey that can be completed quickly after recording.

Potential questions include:

* Overall discomfort
* Perceived loudness
* Painfulness
* Sharpness
* Rumbling
* Screeching
* Vibration
* Intermittency
* Fatigue
* Difficulty having a conversation
* Difficulty hearing announcements
* Desire to cover the ears
* Whether the environment felt suitable for a child
* Whether the user would avoid this section in future

Research the difference between a popularity vote and a structured perception measurement.

Objective and subjective measurements must remain separate in the data model.

10. Open data and reproducibility

Design a public-data system with:

* Versioned schemas
* Measurement provenance
* Device information
* Calibration state
* Processing-pipeline version
* Quality flags
* Uncertainty
* Confidence dimensions
* Data licences
* Machine-readable exports
* Human-readable methodology
* Reproducible processing
* Public issue tracking
* Changelogs
* Dataset releases
* Checksums
* Citation guidance
* Researcher documentation

Raw observations, derived acoustic metrics and passenger-facing interpretations must be separate layers.

A future improvement to an algorithm must create a new derived dataset rather than silently changing historical results.

11. Funding, partnerships and public legitimacy

Research possible relationships with:

* Transport for London
* Greater London Authority
* London boroughs
* Universities
* Acoustic-research groups
* Accessibility organisations
* Hearing and tinnitus charities
* Neurodiversity organisations
* Public-health researchers
* Railway operators
* Open-data organisations
* Innovate UK
* UK research councils
* Civic-technology grants
* Journalism organisations
* Device or microphone manufacturers

Do not assume TfL will fund or formally endorse the project.

Identify:

* What evidence would make the project useful to TfL
* What might make TfL cautious
* How to describe the project without implying official affiliation
* Whether an academic partner would improve credibility
* Whether ethics approval is needed before particular studies
* Which partnerships are useful before launch and which can wait
* Funding opportunities compatible with open data and independence

Product components

Plan the project as a set of related but separable components.

A. Mobile recorder

Likely an iOS-first application capable of:

* Selecting a journey
* Recording raw PCM locally
* Recording motion and relevant device metadata
* Displaying live but non-distracting measurement status
* Operating without connectivity
* Recovering after interruption or crash
* Detecting clipping and microphone problems
* Inferring station boundaries
* Allowing post-recording correction
* Showing privacy and upload choices
* Uploading derived measurements
* Optionally retaining or deleting raw audio

Evaluate React Native with native Swift audio modules against a fully native Swift implementation.

Do not rely on a browser or pure PWA for the scientific collector unless experiments demonstrate sufficient control and reliability.

B. Data-processing pipeline

The pipeline should:

* Validate uploads
* Reject malformed data
* Preserve provenance
* Generate acoustic metrics
* Generate spectral metrics
* Assign quality flags
* Estimate uncertainty
* Detect duplicate or suspicious contributions
* Associate observations with network sections
* support reprocessing with new algorithm versions
* publish dataset releases

C. Public map

The map should show:

* Typical conditions
* Observed ranges
* Sample counts
* Time-of-day variation
* Confidence
* Device-quality distribution
* Frequency character
* Squeal events
* Passenger discomfort
* Recent versus historical measurements

Avoid presenting sparse or uncertain data as precise fact.

D. Research and methodology site

Publish:

* Measurement protocol
* Known limitations
* Calibration experiments
* Data schema
* Processing code
* Privacy model
* Dataset releases
* Academic references
* Research questions
* Contributor guidance
* Governance decisions
* Correction and dispute process

E. Contributor community

Design mechanisms for:

* Route-completion challenges
* Coverage maps
* Repeated-measurement campaigns
* Calibration events
* University participation
* Contributor recognition
* Issue reporting
* Data correction
* Local city chapters
* Avoiding competition that encourages unsafe or fabricated measurements

Recommended implementation sequence

Produce a detailed roadmap using the following approximate phases.

Phase 0: Project foundations

Create:

* Project charter
* Scope statement
* Initial README
* Code of conduct
* Contribution guide
* Governance principles
* Repository structure
* Open-source licence recommendation
* Open-data licence recommendation
* Decision log
* Research-question backlog
* Risk register

Do not claim scientific validity at this stage.

Phase 1: Methodology and schema prototype

Define:

* Measurement record
* Journey model
* Segment model
* Device metadata
* Calibration state
* Acoustic metrics
* Quality flags
* Privacy state
* Consent record
* Processing version
* Subjective survey
* Dataset tiers

Build example JSON records and validate them against representative London journeys.

Phase 2: Acoustic technical spike

Build a minimal iPhone prototype that:

* Records PCM
* Computes basic acoustic metrics
* Records accelerometer data
* Detects clipping
* Logs audio-session state
* Stores everything locally
* Exports a test package

Compare several iPhone models against a trusted reference meter and repeated controlled sounds.

The objective is to establish feasibility and limitations, not launch an app.

Phase 3: Journey and alignment prototype

Build and test:

* Line and journey selection
* Station-to-station topology
* Automatic boundary suggestions
* Drag-to-correct timeline
* Variable-duration stretching
* Branch correction
* Session trimming
* Section deletion

Test this with real journeys before building the public map.

Phase 4: Privacy and contribution flow

Implement:

* Local review
* Exact upload preview
* Derived-data-only upload
* Raw-audio deletion
* Explicit consent
* Data withdrawal identifiers
* Offline upload queue
* Resumable upload
* Encryption
* Clear privacy language

Conduct a privacy threat model.

Phase 5: Backend and open-data pipeline

Implement:

* Upload API
* Schema validation
* Idempotent submission
* Provenance storage
* Processing jobs
* Dataset versioning
* Quality scoring
* Duplicate detection
* Export generation
* Public methodology pages
* Internal auditing tools

Phase 6: Initial London dataset

Conduct a controlled pilot involving a small number of known contributors.

Prioritise:

* Repeated coverage
* Overlapping journeys
* Different iPhone models
* Different carriage locations
* Peak and off-peak journeys
* Known noisy sections
* Quieter comparison sections
* Measurements taken alongside reference equipment

The pilot should favour dense repeated observations over shallow network-wide coverage.

Phase 7: Public map prototype

Build the first map using only data that meets defined quality thresholds.

Display uncertainty, sample size and methodological caveats prominently.

Phase 8: Limited public beta

Invite a bounded community such as:

* London civic-technology groups
* University researchers
* Accessibility communities
* Railway enthusiasts
* Acoustic professionals
* Selected commuters

Monitor data quality, privacy concerns, completion rates and user confusion.

Phase 9: Public London launch

Launch only after:

* Measurement limitations are documented
* Data-quality tiers are working
* Privacy controls have been tested
* The correction interface is usable
* The dataset can be reproduced
* Public claims have been reviewed
* Sparse data is represented honestly

Phase 10: Expansion

Evaluate:

* Android support
* Supported-device lists
* External microphones
* Apple Watch
* AirPods
* Additional London rail systems
* Other cities
* International network imports
* Research APIs
* Third-party applications

Expansion should follow demonstrated demand and measurement validity.

Testing requirements

Produce a complete test matrix covering the following.

Acoustic validity

Test:

* Repeatability on the same device
* Variance across device models
* Comparison with reference equipment
* Frequency-response differences
* Orientation effects
* Case and obstruction effects
* Pocket and bag measurements
* Clipping behaviour
* Low and high sound levels
* Continuous noise
* Tonal squeal
* Impulsive events
* Background speech
* External microphones
* Operating-system updates

Define acceptable limits separately for:

* Research-grade absolute measurements
* Model-profiled measurements
* Relative route comparisons
* Informal public contributions

Journey alignment

Measure:

* Correct station-section assignment
* Boundary timing error
* Branch-selection accuracy
* Delay handling
* Transfer detection
* Recording started late
* Recording ended early
* Correction completion time
* User correction error rate
* Confidence calibration

Reliability

Test:

* Airplane mode
* Loss of connectivity
* Thirty- to ninety-minute journeys
* Low battery
* Screen locked
* Incoming calls
* Audio-route changes
* Bluetooth connection
* App backgrounding
* App termination
* Device storage pressure
* Crash recovery
* Duplicate upload
* Interrupted upload
* Schema migration

Privacy

Test that:

* Nothing uploads before consent
* Raw audio is excluded by default
* Users can inspect uploaded fields
* Deleted audio is actually removed
* Trimmed sections cannot be reconstructed
* Withdrawal works
* Identifiers are appropriately pseudonymous
* Precise location is not retained unnecessarily
* Logs do not contain private audio or text
* Research exports do not expose contributor identity

Data integrity

Test:

* Schema validation
* Checksums
* Processing determinism
* Algorithm versioning
* Reprocessing
* Provenance
* Idempotency
* Duplicate detection
* Impossible journeys
* Fabricated timestamps
* Corrupted sensor frames
* Missing metadata
* Conflicting route information
* Public dataset regeneration

Usability

Set measurable targets such as:

* A new contributor can begin a valid recording quickly
* The app can be used one-handed
* The user does not need to watch the screen throughout the journey
* Most recordings can be reviewed rapidly
* Station-boundary corrections are understandable without training
* Privacy choices are comprehensible
* Accessibility labels and dynamic text work
* Colour is not the only quality indicator
* The interface works in a noisy, crowded and moving train

Do not choose final numeric targets without testing them with users.

Public-map honesty

Test that the map:

* Shows sample size
* Shows uncertainty
* Distinguishes recent and historical data
* Does not rank routes with insufficient evidence
* Does not conceal device-quality differences
* Separates measured noise from passenger perception
* Explains derived scores
* Avoids unsupported health claims
* Allows researchers to inspect underlying records

Data-quality tiers

Develop and test a tiering system similar to:

Tier A

Professional reference equipment or validated external microphone under a documented protocol.

Tier B

Supported consumer-device model with an experimentally established correction profile.

Tier C

Project app on an unprofiled device with complete metadata and no major quality warnings.

Tier D

Imported recording or incomplete project-app session with reduced control over processing.

Tier E

Manual reading, legacy contribution or observation lacking sufficient technical metadata.

The final design may change, but low-confidence observations must not silently appear equivalent to reference-quality measurements.

Quality flags

Define flags for conditions including:

* Audio clipping
* Dropout
* Sample-rate change
* Bluetooth input
* Voice-processing mode
* Automatic gain behaviour
* Obstructed microphone
* Phone in pocket or bag
* Incoming call
* App interruption
* Recording too short
* Missing station assignment
* Implausible journey speed
* Walking or station recording mixed with train recording
* Route mismatch
* Duplicate session
* Excessive speech
* Insufficient usable frequency range
* Unknown device profile

Confidence should not be represented by one universal score. Consider separate confidence dimensions for:

* Acoustic level
* Frequency content
* Journey assignment
* Device calibration
* User metadata
* Subjective response

Repository planning

Recommend an initial monorepo or multi-repository structure.

A possible monorepo could contain:

/apps/ios
/apps/web
/services/api
/packages/schema
/packages/acoustics
/packages/network-model
/packages/processing
/packages/ui
/packages/test-fixtures
/data/network-definitions
/docs/methodology
/docs/privacy
/docs/research
/docs/governance

Determine which acoustic processing must remain native and which logic can be shared safely.

The repository should support:

* Automated tests
* Example datasets
* Reproducible analysis
* Schema validation
* Documentation builds
* Dataset-release scripts
* Issue templates
* Research decision records
* Security reporting
* Privacy review

Expected outputs from you

Produce the work in the following order.

Output 1: Assumptions and open questions

List the most important unresolved decisions. Identify which require research, experiments, legal advice, user testing or stakeholder discussion.

Output 2: Research map

Create a structured map of research areas, specific questions, preferred source types and expected decisions.

Use primary sources for:

* Standards
* Acoustic science
* Platform APIs
* Privacy law
* Transport data
* Academic methodology

Do not invent statistics or repeat unsourced claims.

Output 3: Product and scientific architecture

Provide:

* System diagram
* Data-flow diagram
* Privacy boundaries
* Raw versus derived data layers
* Processing-version model
* Device-calibration model
* Journey-segmentation model
* Public-data model

Output 4: Phased implementation roadmap

Break each phase into:

* Objective
* Dependencies
* Research tasks
* Product tasks
* Engineering tasks
* Tests
* Documentation
* Exit criteria
* Risks
* Go or no-go decision

Output 5: Initial GitHub backlog

Create epics and implementable issues.

Each issue should include:

* Problem
* Scope
* Non-goals
* Acceptance criteria
* Test requirements
* Dependencies
* Relevant research
* Privacy implications
* Data-model implications

Output 6: Test strategy

Produce a test matrix for:

* Scientific validity
* Device compatibility
* Route alignment
* Offline reliability
* Privacy
* Data integrity
* User experience
* Accessibility
* Security
* Public-data reproducibility

Output 7: Pilot design

Design a London pilot specifying:

* Priority lines and sections
* Sample strategy
* Device mix
* Repeat measurements
* Reference measurements
* Passenger-load variation
* Time-of-day coverage
* Carriage-position variation
* Contributor training
* Privacy procedure
* Analysis plan
* Success criteria

Output 8: Risk register

Include:

* Misleading measurements
* Unsupported medical claims
* Privacy breach
* Incidental speech collection
* Device fragmentation
* Poor contributor retention
* Sparse coverage
* Malicious contributions
* Transport-operator objections
* Accidental implication of TfL endorsement
* Academic criticism
* Licensing conflict
* Dataset maintenance burden
* Costs of audio storage
* International expansion complexity

Output 9: Public documentation outline

Draft the structure for:

* README
* Project website
* Methodology
* Privacy notice
* Contributor guide
* Researcher guide
* Data dictionary
* Governance
* Limitations
* Citation instructions
* Press page
* Frequently asked questions

Decision-making rules

Throughout the work:

* Prefer experiments over assumptions
* Prefer transparent uncertainty over artificial precision
* Prefer a small valid dataset over a large misleading one
* Prefer derived acoustic information over raw audio unless raw audio is demonstrably necessary
* Prefer local review before upload
* Keep the London pilot concrete while making the core schema reasonably portable
* Do not prematurely support every device and network
* Do not treat crowdsourced volume as a substitute for validation
* Do not treat laboratory measurements as a substitute for real-world variation
* Do not combine objective measurements and subjective experience into an unexplained score
* Do not imply that the project is operated, approved or endorsed by TfL
* Document why every major scientific and architectural decision was made

The eventual goal is not merely to build a noise map. It is to establish a trustworthy open protocol, contribution system and public dataset for understanding the acoustic conditions passengers actually experience.