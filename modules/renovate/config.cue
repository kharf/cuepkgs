package renovate

_schema
_schema: {
	// JSON schema for Renovate config files
	// (https://renovatebot.com/)
	@jsonschema(schema="http://json-schema.org/draft-04/schema#")

	// Labels to add to Pull Request.
	addLabels?: [...string]

	// Additional string value to be appended to `branchPrefix`.
	additionalBranchPrefix?: string | *""

	// Additional reviewers for Pull Requests (in contrast to
	// `reviewers`, this option adds to the existing reviewer list,
	// rather than replacing it).
	additionalReviewers?: [...string]

	// Set this to `true` to allow custom crate registries.
	allowCustomCrateRegistries?: bool | *false

	// Set this to `true` if repositories are allowed to run install
	// plugins.
	allowPlugins?: bool | *false

	// Set this to `false` to disable template compilation for
	// post-upgrade commands.
	allowPostUpgradeCommandTemplating?: bool | *true

	// Set this to `true` if repositories are allowed to run install
	// scripts.
	allowScripts?: bool | *false

	// List of allowed patterns for environment variable names in
	// repository env config.
	allowedEnv?: [...string]

	// List of allowed patterns for header names in repository
	// hostRules config.
	allowedHeaders?: [...string] | *["X-*"]

	// A list of regular expressions that decide which post-upgrade
	// tasks are allowed.
	allowedPostUpgradeCommands?: [...string]

	// Configuration object for the ansible manager
	ansible?: _schema_1 | *{
		fileMatch: ["(^|/)tasks/[^/]+\\.ya?ml$"]
		...
	}

	// Configuration object for the ansible-galaxy manager
	"ansible-galaxy"?: _schema_5 | *{
		fileMatch: ["(^|/)(galaxy|requirements)(\\.ansible)?\\.ya?ml$"]
		...
	}

	// Configuration object for the argocd manager
	argocd?: _schema_A | *{
		fileMatch:
		[]
		...
	}

	// Configuration object for the asdf manager
	asdf?: _schema_8 | *{
		fileMatch: ["(^|/)\\.tool-versions$"]
		...
	}

	// Assign reviewers and assignees even if the PR is to be
	// automerged.
	assignAutomerge?: bool | *false

	// Assignees for Pull Request (either username or email address
	// depending on the platform).
	assignees?: [...string]

	// Determine assignees based on configured code owners and changes
	// in PR.
	assigneesFromCodeOwners?: bool | *false

	// Take a random sample of given size from `assignees`.
	assigneesSampleSize?: int | *null

	// Set to `true` to automatically approve PRs.
	autoApprove?: bool | *false

	// Control whether replacement regular expressions are global
	// matches or only the first match.
	autoReplaceGlobalMatch?: bool | *true

	// Autodiscover all repositories.
	autodiscover?: bool | *false

	// Filter the list of autodiscovered repositories.
	autodiscoverFilter?: [...string] | string | *null

	// Filter the list of autodiscovered repositories by namespaces.
	autodiscoverNamespaces?: [...string] | *null

	// Filter the list of autodiscovered repositories by topics.
	autodiscoverTopics?: [...string] | *null

	// Whether to automerge branches/PRs automatically, without human
	// intervention.
	automerge?: bool | *false

	// PR comment to add to trigger automerge. Only used if
	// `automergeType=pr-comment`.
	automergeComment?: string | *"automergeComment"

	// Limit automerge to these times of day or week.
	automergeSchedule?: [...string] | string | *["at any time"]

	// The merge strategy to use when automerging PRs. Used only if
	// `automergeType=pr`.
	automergeStrategy?: "auto" | "fast-forward" | "merge-commit" | "rebase" | "squash" | *"auto"

	// How to automerge, if enabled.
	automergeType?: "branch" | "pr" | "pr-comment" | *"pr"

	// Configuration object for the azure-pipelines manager
	"azure-pipelines"?: _schema_E | *{
		fileMatch: ["azure.*pipelines?.*\\.ya?ml$"]
		enabled: false
		...
	}

	// The id of an existing work item on Azure Boards to link to each
	// PR.
	azureWorkItemId?: int | *0

	// List of one or more custom base branches defined as exact
	// strings and/or via regex expressions.
	baseBranches?: [...string]

	// The base directory for Renovate to store local files, including
	// repository files and cache. If left empty, Renovate will
	// create its own temporary directory to use.
	baseDir?: string

	// Configuration object for the batect manager
	batect?: _schema_B | *{
		fileMatch: ["(^|/)batect(-bundle)?\\.ya?ml$"]
		...
	}

	// Configuration object for the batect-wrapper manager
	"batect-wrapper"?: _schema_36 | *{
		fileMatch: ["(^|/)batect$"]
		versioning: "semver"
		...
	}

	// Configuration object for the bazel manager
	bazel?: _schema_9 | *{
		fileMatch: ["(^|/)WORKSPACE(|\\.bazel)$", "\\.bzl$"]
		...
	}

	// Configuration object for the bazel-module manager
	"bazel-module"?: _schema_3 | *{
		fileMatch: ["(^|/)MODULE\\.bazel$"]
		...
	}

	// Configuration object for the bazelisk manager
	bazelisk?: _schema_A2 | *{
		fileMatch: ["(^|/)\\.bazelversion$"]
		pinDigests: false
		versioning: "semver"
		...
	}

	// Use the default reviewers (Bitbucket only).
	bbUseDefaultReviewers?: bool | *true

	// Use the repository's [development
	// branch](https://support.atlassian.com/bitbucket-cloud/docs/branch-a-repository/#The-branching-model)
	// as the repository's default branch.
	bbUseDevelopmentBranch?: bool | *false

	// Configuration object for the bicep manager
	bicep?: _schema_F | *{
		fileMatch: ["\\.bicep$"]
		...
	}

	// Controls how third-party tools like npm or Gradle are called:
	// directly, via Docker sidecar containers, or via dynamic
	// install.
	binarySource?: "global" | "docker" | "install" | "hermit" | *"install"

	// Configuration object for the bitbucket-pipelines manager
	"bitbucket-pipelines"?: _schema_D0 | *{
		fileMatch: ["(^|/)\\.?bitbucket-pipelines\\.ya?ml$"]
		...
	}

	// Limit to a maximum of x concurrent branches. 0 means no limit,
	// `null` (default) inherits value from `prConcurrentLimit`.
	branchConcurrentLimit?: int | *null

	// Branch name template.
	branchName?: string | *"{{{branchPrefix}}}{{{additionalBranchPrefix}}}{{{branchTopic}}}"

	// Whether to be strict about the use of special characters within
	// the branch name.
	branchNameStrict?: bool | *false

	// Prefix to use for all branch names.
	branchPrefix?: string | *"renovate/"

	// Old branchPrefix value to check for existing PRs.
	branchPrefixOld?: string | *"renovate/"

	// Branch topic.
	branchTopic?: string | *"{{{depNameSanitized}}}-{{{newMajor}}}{{#if separateMinorPatch}}{{#if isPatch}}.{{{newMinor}}}{{/if}}{{/if}}.x{{#if isLockfileUpdate}}-lockfile{{/if}}"

	// Configuration object for the buildkite manager
	buildkite?: _schema_EF | *{
		fileMatch: ["buildkite\\.ya?ml", "\\.buildkite/.+\\.ya?ml$"]
		commitMessageTopic: "buildkite plugin {{depName}}"
		commitMessageExtra: "to {{#if isMajor}}{{{prettyNewMajor}}}{{else}}{{{newValue}}}{{/if}}"
		...
	}

	// Bump the version in the package file being updated.
	bumpVersion?: "major" | "minor" | "patch" | "prerelease"

	// Configuration object for the bun manager
	bun?: _schema_0 | *{
		fileMatch: ["(^|/)bun\\.lockb$"]
		digest: {
			prBodyDefinitions: {
				Change: "{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}"
				...
			}
			...
		}
		prBodyDefinitions: {
			Change: "[{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}]({{#if depName}}https://renovatebot.com/diffs/npm/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}{{/if}})"
			...
		}
		...
	}

	// Configuration object for the bundler manager
	bundler?: _schema_34 | *{
		fileMatch: ["(^|/)Gemfile$"]
		versioning: "ruby"
		...
	}

	// The directory where Renovate stores its cache. If left empty,
	// Renovate creates a subdirectory within the `baseDir`.
	cacheDir?: string

	// Maximum duration in minutes to keep datasource cache entries.
	cacheHardTtlMinutes?: int | *10080

	// An object that contains cache namespace TTL override values.
	cacheTtlOverride?: _schema_8B | *{
		...
	}

	// Configuration object for the cake manager
	cake?: _schema_38 | *{
		fileMatch: ["\\.cake$"]
		...
	}

	// Configuration object for the cargo manager
	cargo?: _schema_2 | *{
		commitMessageTopic: "Rust crate {{depName}}"
		fileMatch: ["(^|/)Cargo\\.toml$"]
		versioning: "cargo"
		...
	}

	// Configuration object for the cdnurl manager
	cdnurl?: _schema_DB | *{
		fileMatch: []
		versioning: "semver"
		...
	}

	// A list of branch names to mark for creation or rebasing as if
	// it was selected in the Dependency Dashboard issue.
	checkedBranches?: [...string]

	// Configuration object for the circleci manager
	circleci?: _schema_3D | *{
		fileMatch: ["(^|/)\\.circleci/.+\\.ya?ml$"]
		...
	}

	// Set to `true` to initialize submodules during repository clone.
	cloneSubmodules?: bool | *false

	// Configuration object for the cloudbuild manager
	cloudbuild?: _schema_C | *{
		fileMatch: ["(^|/)cloudbuild\\.ya?ml"]
		...
	}

	// Configuration object for the cocoapods manager
	cocoapods?: _schema_DD | *{
		fileMatch: ["(^|/)Podfile$"]
		versioning: "ruby"
		...
	}

	// Commit message body template. Will be appended to commit
	// message, separated by two line returns.
	commitBody?: string

	// If enabled, append a table in the commit message body
	// describing all updates in the commit.
	commitBodyTable?: bool | *false

	// Message to use for commit messages and pull request titles.
	commitMessage?: string | *"{{{commitMessagePrefix}}} {{{commitMessageAction}}} {{{commitMessageTopic}}} {{{commitMessageExtra}}} {{{commitMessageSuffix}}}"

	// Action verb to use in commit messages and PR titles.
	commitMessageAction?: string | *"Update"

	// Extra description used after the commit message topic -
	// typically the version.
	commitMessageExtra?: string | *"to {{#if isPinDigest}}{{{newDigestShort}}}{{else}}{{#if isMajor}}{{prettyNewMajor}}{{else}}{{#if isSingleVersion}}{{prettyNewVersion}}{{else}}{{#if newValue}}{{{newValue}}}{{else}}{{{newDigestShort}}}{{/if}}{{/if}}{{/if}}{{/if}}"

	// Lowercase PR- and commit titles.
	commitMessageLowerCase?: "auto" | "never" | *"auto"

	// Prefix to add to start of commit messages and PR titles. Uses a
	// semantic prefix if `semanticCommits` is enabled.
	commitMessagePrefix?: string

	// Suffix to add to end of commit messages and PR titles.
	commitMessageSuffix?: string

	// The upgrade topic/noun used in commit messages and PR titles.
	commitMessageTopic?: string | *"dependency {{depName}}"

	// Configuration object for the composer manager
	composer?: _schema_44D | *{
		fileMatch: ["(^|/)([\\w-]*)composer\\.json$"]
		versioning: "composer"
		...
	}

	// Configure use of `--ignore-platform-reqs` or
	// `--ignore-platform-req` for the Composer package manager.
	composerIgnorePlatformReqs?: [...string]

	// Configuration object for the conan manager
	conan?: _schema_FA | *{
		fileMatch: ["(^|/)conanfile\\.(txt|py)$"]
		datasource: "conan"
		versioning: "conan"
		enabled:    false
		...
	}

	// If enabled, issues created by Renovate are set as confidential.
	confidential?: bool | *false

	// Enable this to get config migration PRs when needed.
	configMigration?: bool | *false

	// Set this to `false` to make Renovate create a new issue for
	// each config warning, instead of reopening or reusing an
	// existing issue.
	configWarningReuseIssue?: bool | *true

	// Configuration object to define language or manager version
	// constraints.
	constraints?: _schema_9F | *{
		...
	}

	// Perform release filtering based on language constraints.
	constraintsFiltering?: "none" | "strict" | *"none"

	// The directory where Renovate stores its containerbase cache. If
	// left empty, Renovate creates a subdirectory within the
	// `cacheDir`.
	containerbaseDir?: string

	// Configuration object for the cpanfile manager
	cpanfile?: _schema_EE | *{
		fileMatch: ["(^|/)cpanfile$"]
		...
	}

	// Configuration object for the crossplane manager
	crossplane?: _schema_C2 | *{
		fileMatch:
		[]
		...
	}

	// Defines custom datasources for usage by managers.
	customDatasources?: _schema_B5 & [...{
		description?: [...string] | string

		// Template for generating a `defaultRegistryUrl` for custom
		// datasource.
		defaultRegistryUrlTemplate?: string | *""

		// Format of the custom datasource.
		format?: "json" | "plain" | *"json"

		// List of jsonata transformation rules.
		transformTemplates?: [...string]
		...
	}] | *{
		...
	}

	// Custom environment variables for child processes and sidecar
	// Docker containers.
	customEnvVariables?: _schema_F9 | *{
		...
	}

	// Custom managers using regex matching.
	customManagers?: [...{
		description?: [...string] | string

		// Optional `extractVersion` for extracted dependencies. Valid
		// only within a `customManagers` object.
		autoReplaceStringTemplate?: string

		// Optional `currentValue` for extracted dependencies. Valid only
		// within a `customManagers` object.
		currentValueTemplate?: string

		// Custom manager to use. Valid only within a `customManagers`
		// object.
		customType?: "regex"

		// Optional datasource for extracted dependencies. Valid only
		// within a `customManagers` object.
		datasourceTemplate?: string

		// Optional depName for extracted dependencies. Valid only within
		// a `customManagers` object.
		depNameTemplate?: string

		// Optional `depType` for extracted dependencies. Valid only
		// within a `customManagers` object.
		depTypeTemplate?: string

		// Optional `extractVersion` for extracted dependencies. Valid
		// only within a `customManagers` object.
		extractVersionTemplate?: string

		// Regex capture rule to use. Valid only within a `customManagers`
		// object.
		matchStrings?: [...string]

		// Strategy how to interpret matchStrings.
		matchStringsStrategy?: "any" | "recursive" | "combination" | *"any"

		// Optional packageName for extracted dependencies, else defaults
		// to `depName` value. Valid only within a `customManagers`
		// object.
		packageNameTemplate?: string

		// Optional registry URL for extracted dependencies. Valid only
		// within a `customManagers` object.
		registryUrlTemplate?: string

		// Optional versioning for extracted dependencies. Valid only
		// within a `customManagers` object.
		versioningTemplate?: string
		...
	}]

	// Customize sections in the Dependency Dashboard issue.
	customizeDashboard?: _schema_E2 & {
		[string]: string
	} | *{
		...
	}

	// List of registry URLs to use as the default for a datasource.
	defaultRegistryUrls?: [...string] | *null

	// Whether to create a "Dependency Dashboard" issue in the
	// repository.
	dependencyDashboard?: bool | *false

	// Controls if updates need manual approval from the Dependency
	// Dashboard issue before PRs are created.
	dependencyDashboardApproval?: bool | *false

	// Set to `true` to let Renovate close the Dependency Dashboard
	// issue if there are no more updates.
	dependencyDashboardAutoclose?: bool | *false

	// Any text added here will be placed last in the Dependency
	// Dashboard issue body, with a divider separator before it.
	dependencyDashboardFooter?: string

	// Any text added here will be placed first in the Dependency
	// Dashboard issue body.
	dependencyDashboardHeader?: string | *"This issue lists Renovate updates and detected dependencies. Read the [Dependency Dashboard](https://docs.renovatebot.com/key-concepts/dashboard/) docs to learn more."

	// These labels will always be applied on the Dependency Dashboard
	// issue, even when they have been removed manually.
	dependencyDashboardLabels?: [...string] | *null

	// Control if the Dependency Dashboard issue lists CVEs supplied
	// by [osv.dev](https://osv.dev).
	dependencyDashboardOSVVulnerabilitySummary?: "none" | "all" | "unresolved" | *"none"

	// Title for the Dependency Dashboard issue.
	dependencyDashboardTitle?: string | *"Dependency Dashboard"

	// Configuration object for the deps-edn manager
	"deps-edn"?: _schema_82 | *{
		fileMatch: ["(^|/)(?:deps|bb)\\.edn$"]
		versioning: "maven"
		...
	}

	// Plain text description for a config or preset.
	description?: [...string] | string

	// If `true`, Renovate tries to detect global manager
	// configuration from the file system.
	detectGlobalManagerConfig?: bool | *false

	// If `true`, Renovate tries to detect host rules from environment
	// variables.
	detectHostRulesFromEnv?: bool | *false

	// Configuration to apply when updating a digest (no change in
	// tag/version).
	digest?: _schema_4 | *{
		branchTopic:        "{{{depNameSanitized}}}-digest"
		commitMessageExtra: "to {{newDigestShort}}"
		commitMessageTopic: "{{{depName}}} digest"
		...
	}

	// Configuration object for the docker-compose manager
	"docker-compose"?: _schema_B49 | *{
		fileMatch: ["(^|/)(?:docker-)?compose[^/]*\\.ya?ml$"]
		...
	}

	// Change this value to add a prefix to the Renovate Docker
	// sidecar container names and labels.
	dockerChildPrefix?: string | *"renovate_"

	// Pass CLI flags to `docker run` command when
	// `binarySource=docker`.
	dockerCliOptions?: string

	// Change this value to override the default Renovate sidecar
	// image.
	dockerSidecarImage?: string | *"ghcr.io/containerbase/sidecar:10.2.3"

	// Set the `UID` and `GID` for Docker-based binaries if you use
	// `binarySource=docker`.
	dockerUser?: string

	// Configuration object for the dockerfile manager
	dockerfile?: _schema_A9 | *{
		fileMatch: ["(^|/|\\.)([Dd]ocker|[Cc]ontainer)file$", "(^|/)([Dd]ocker|[Cc]ontainer)file[^/]*$"]
		...
	}

	// If set to `true` then Renovate creates draft PRs, instead of
	// normal status PRs.
	draftPR?: bool | *false

	// Configuration object for the droneci manager
	droneci?: _schema_DF | *{
		fileMatch: ["(^|/)\\.drone\\.yml$"]
		...
	}

	// If enabled, perform a dry run by logging messages instead of
	// creating/updating/deleting branches and PRs.
	dryRun?: "extract" | "lookup" | "full" | *null

	// Enable or disable Renovate bot.
	enabled?: bool | *true

	// A list of package managers to enable. Only managers on the list
	// are enabled.
	enabledManagers?: [...string]

	// An object containing configuration encrypted with project key.
	encrypted?: _schema_ED | *null

	// Custom endpoint to use.
	endpoint?: string | *null

	// Environment variables that Renovate uses when executing package
	// manager commands.
	env?: _schema_CBE | *{
		...
	}

	// A file matching any of these glob patterns will not be
	// committed, even if the file has been updated.
	excludeCommitPaths?: [...string]

	// Default execution timeout in minutes for child processes
	// Renovate creates.
	executionTimeout?: int | *15

	// Expand the configured code owner groups into a full list of
	// group members.
	expandCodeOwnersGroups?: bool | *false

	// Set this to `true` to allow passing of all environment
	// variables to package managers.
	exposeAllEnv?: bool | *false

	// Configuration presets to use or extend.
	extends?: [...string] | string

	// A regex (`re2`) to extract a version from a datasource's raw
	// version string.
	extractVersion?: string

	// Controls if and when changelogs/release notes are fetched.
	fetchChangeLogs?: "off" | "branch" | "pr" | *"pr"

	// RegEx (`re2`) pattern for matching manager files.
	fileMatch?: [...string] | string

	// Filter reviewers and assignees based on their availability.
	filterUnavailableUsers?: bool | *false

	// Configuration object for the fleet manager
	fleet?: _schema_C3 | *{
		fileMatch: ["(^|/)fleet\\.ya?ml"]
		...
	}

	// Configuration object for the flux manager
	flux?: _schema_74 | *{
		fileMatch: ["(?:^|/)gotk-components\\.ya?ml$"]
		...
	}

	// If defined, packages will follow this release tag exactly.
	followTag?: string

	// Any configuration set in this object will force override
	// existing settings.
	force?: _schema_E1

	// Decides if CLI configuration options are moved to the `force`
	// config section.
	forceCli?: bool | *true

	// Whether to create forks as needed at runtime when running in
	// "fork mode".
	forkCreation?: bool | *true

	// Disallow maintainers to push to Renovate pull requests when
	// running in fork mode.
	forkModeDisallowMaintainerEdits?: bool | *false

	// The preferred organization to create or find forked
	// repositories, when in fork mode.
	forkOrg?: string

	// Whether to process forked repositories. By default, all forked
	// repositories are skipped when in `autodiscover` mode.
	forkProcessing?: "auto" | "enabled" | "disabled" | *"auto"

	// Set a personal access token here to enable "fork mode".
	forkToken?: string

	// Configuration object for the fvm manager
	fvm?: _schema_6 | *{
		fileMatch: ["(^|/)\\.fvm/fvm_config\\.json$"]
		versioning: "semver"
		...
	}

	// Configuration object for the git-submodules manager
	"git-submodules"?: _schema_C1 | *{
		enabled:    false
		versioning: "git"
		fileMatch: ["(^|/)\\.gitmodules$"]
		...
	}

	// Author to use for Git commits. Must conform to
	// [RFC5322](https://datatracker.ietf.org/doc/html/rfc5322).
	gitAuthor?: string

	// Git authors which are ignored by Renovate. Must conform to
	// [RFC5322](https://datatracker.ietf.org/doc/html/rfc5322).
	gitIgnoredAuthors?: [...string]

	// Ignore approval rules for MRs created by Renovate, which is
	// useful for automerge.
	gitLabIgnoreApprovals?: bool | *false

	// Which Git commands will be run with the `--no-verify` option.
	gitNoVerify?: [..."commit" | "push"] | ("commit" | "push") | *["commit", "push"]

	// PGP key to use for signing Git commits.
	gitPrivateKey?: string

	// Configure the timeout with a number of milliseconds to wait for
	// a Git task.
	gitTimeout?: int | *0

	// Overrides the default resolution for Git remote, e.g. to switch
	// GitLab from HTTPS to SSH-based.
	gitUrl?: "default" | "ssh" | "endpoint" | *"default"

	// Configuration object for the github-actions manager
	"github-actions"?: _schema_62 | *{
		fileMatch: ["(^|/)(workflow-templates|\\.(?:github|gitea|forgejo)/(?:workflows|actions))/.+\\.ya?ml$", "(^|/)action\\.ya?ml$"]
		...
	}

	// Display warnings about GitHub token not being set.
	githubTokenWarn?: bool | *true

	// Configuration object for the gitlabci manager
	gitlabci?: _schema_2C | *{
		fileMatch: ["\\.gitlab-ci\\.ya?ml$"]
		...
	}

	// Configuration object for the gitlabci-include manager
	"gitlabci-include"?: _schema_28 | *{
		fileMatch: ["\\.gitlab-ci\\.ya?ml$"]
		...
	}

	// Configuration presets to use or extend for a self-hosted
	// config.
	globalExtends?: [...string]

	// Directory pattern to run `go get` on.
	goGetDirs?: [...string] | *["./..."]

	// Configuration object for the gomod manager
	gomod?: _schema_D | *{
		fileMatch: ["(^|/)go\\.mod$"]
		pinDigests: false
		...
	}

	// Configuration object for the gradle manager
	gradle?: _schema_46 | *{
		fileMatch: ["\\.gradle(\\.kts)?$", "(^|/)gradle\\.properties$", "(^|/)gradle/.+\\.toml$", "(^|/)buildSrc/.+\\.kt$", "\\.versions\\.toml$", "(^|/)versions.props$", "(^|/)versions.lock$"]
		timeout:    600
		versioning: "gradle"
		...
	}

	// Configuration object for the gradle-wrapper manager
	"gradle-wrapper"?: _schema_F2 | *{
		fileMatch: ["(^|/)gradle/wrapper/gradle-wrapper\\.properties$"]
		versioning: "gradle"
		...
	}

	// Config if `groupName` is enabled.
	group?: _schema_21C | *{
		branchTopic:        "{{{groupSlug}}}"
		commitMessageTopic: "{{{groupName}}}"
		...
	}

	// Human understandable name for the dependency group.
	groupName?: string | *null

	// Slug to use for group (e.g. in branch name). Slug is calculated
	// from `groupName` if `null`.
	groupSlug?: string | *null

	// If enabled, branch names will use a hashing function to ensure
	// each branch has that length.
	hashedBranchLength?: int | *null

	// Configuration object for the helm-requirements manager
	"helm-requirements"?: _schema_45 | *{
		registryAliases: {
			stable: "https://charts.helm.sh/stable"
			...
		}
		commitMessageTopic: "helm chart {{depName}}"
		fileMatch: ["(^|/)requirements\\.ya?ml$"]
		...
	}

	// Configuration object for the helm-values manager
	"helm-values"?: _schema_C5 | *{
		commitMessageTopic: "helm values {{depName}}"
		fileMatch: ["(^|/)values\\.ya?ml$"]
		pinDigests: false
		...
	}

	// Configuration object for the helmfile manager
	helmfile?: _schema_1F | *{
		registryAliases: {
			stable: "https://charts.helm.sh/stable"
			...
		}
		commitMessageTopic: "helm chart {{depName}}"
		fileMatch: ["(^|/)helmfile\\.ya?ml(?:\\.gotmpl)?$"]
		...
	}

	// Configuration object for the helmsman manager
	helmsman?: _schema_83 | *{
		fileMatch:
		[]
		...
	}

	// Configuration object for the helmv3 manager
	helmv3?: _schema_95 | *{
		registryAliases: {
			stable: "https://charts.helm.sh/stable"
			...
		}
		commitMessageTopic: "helm chart {{depName}}"
		fileMatch: ["(^|/)Chart\\.ya?ml$"]
		...
	}

	// Configuration object for the hermit manager
	hermit?: _schema_11 | *{
		fileMatch: ["(^|/)bin/hermit$"]
		excludeCommitPaths: ["**/bin/hermit"]
		versioning: "hermit"
		...
	}

	// Configuration object for the homebrew manager
	homebrew?: _schema_F4 | *{
		commitMessageTopic: "Homebrew Formula {{depName}}"
		fileMatch: ["^Formula/[^/]+[.]rb$"]
		...
	}

	// Host rules/configuration including credentials.
	hostRules?: [...{
		description?: [...string] | string

		// A list of HTTP status codes safe to ignore even when
		// `abortOnError=true`.
		abortIgnoreStatusCodes?: [...number]

		// If enabled, Renovate aborts its run when HTTP request errors
		// occur.
		abortOnError?: bool | *false

		// A list of package managers to enable artifact auth. Only
		// managers on the list are enabled. All are enabled if `null`.
		artifactAuth?: [..."composer"] | *null

		// Authentication type for HTTP header. e.g. `"Bearer"` or
		// `"Basic"`. Use `"Token-Only"` to use only the token without an
		// authorization type.
		authType?: string | *"Bearer"

		// Limit concurrent requests per host.
		concurrentRequestLimit?: int | *null

		// Enable got DNS cache.
		dnsCache?: bool | *false

		// Enable got HTTP/2 support.
		enableHttp2?: bool | *false

		// Put fields to be forwarded to the HTTP request headers in the
		// headers config option.
		headers?: _schema_25

		// hostType for a package rule. Can be a platform name or a
		// datasource name.
		hostType?: string

		// The certificate chains in PEM format.
		httpsCertificate?: string | *null

		// The overriding trusted CA certificate.
		httpsCertificateAuthority?: string | *null

		// The private key in PEM format.
		httpsPrivateKey?: string | *null

		// Explicitly turn on insecure Docker registry access (HTTP).
		insecureRegistry?: bool | *false

		// Enable HTTP keep-alive for hosts.
		keepAlive?: bool | *false

		// A domain name, host name or base URL to match against.
		matchHost?: string

		// Limit requests rate per host.
		maxRequestsPerSecond?: int | *0

		// Maximum retry-after header value to wait for before retrying a
		// failed request.
		maxRetryAfter?: int | *60

		// Timeout (in milliseconds) for queries to external endpoints.
		timeout?: int
		...
	}]

	// Configuration object for the html manager
	html?: _schema_7F | *{
		fileMatch: ["\\.html?$"]
		versioning: "semver"
		digest: {
			enabled: false
			...
		}
		pinDigests: false
		...
	}

	// Avoid upgrading from a non-deprecated version to a deprecated
	// one.
	ignoreDeprecated?: bool | *true

	// Dependencies to ignore.
	ignoreDeps?: [...string]

	// Skip any package file whose path matches one of these. Can be a
	// string or glob pattern.
	ignorePaths?: [...string] | *["**/node_modules/**", "**/bower_components/**"]

	// Set this to `true` if `allowPlugins=true` but you wish to skip
	// running plugins when updating lock files.
	ignorePlugins?: bool | *false

	// Set to `true` to fetch the entire list of PRs instead of only
	// those authored by the Renovate user.
	ignorePrAuthor?: bool | *false

	// A list of presets to ignore, including any that are nested
	// inside an `extends` array.
	ignorePresets?: [...string] | string

	// Reviewers to be ignored in PR reviewers presence (either
	// username or email address depending on the platform).
	ignoreReviewers?: [...string]

	// Set this to `false` if `allowScripts=true` and you wish to run
	// scripts when updating lock files.
	ignoreScripts?: bool | *true

	// Set to `true` to enable automerging without tests.
	ignoreTests?: bool | *false

	// Ignore versions with unstable SemVer.
	ignoreUnstable?: bool | *true

	// Whether to process repositories that are mirrors. By default,
	// repositories that are mirrors are skipped.
	includeMirrors?: bool | *false

	// Include package files only within these defined paths.
	includePaths?: [...string]

	// Whether to consider passing internal checks such as
	// `minimumReleaseAge` when determining branch status.
	internalChecksAsSuccess?: bool | *false

	// When and how to filter based on internal checks.
	internalChecksFilter?: "strict" | "flexible" | "none" | *"strict"

	// Configuration object for the jenkins manager
	jenkins?: _schema_66A | *{
		fileMatch: ["(^|/)plugins\\.(txt|ya?ml)$"]
		...
	}

	// Configuration object for the jsonnet-bundler manager
	"jsonnet-bundler"?: _schema_A7 | *{
		fileMatch: ["(^|/)jsonnetfile\\.json$"]
		datasource: "git-tags"
		...
	}

	// If set, users can add this label to PRs to request they be kept
	// updated with the base branch.
	keepUpdatedLabel?: string

	// Configuration object for the kotlin-script manager
	"kotlin-script"?: _schema_88 | *{
		fileMatch: ["^.+\\.main\\.kts$"]
		...
	}

	// Configuration object for the kubernetes manager
	kubernetes?: _schema_1E | *{
		fileMatch:
		[]
		...
	}

	// Configuration object for the kustomize manager
	kustomize?: _schema_42 | *{
		fileMatch: ["(^|/)kustomization\\.ya?ml$"]
		pinDigests: false
		...
	}

	// Labels to set in Pull Request.
	labels?: [...string]

	// Configuration object for the leiningen manager
	leiningen?: _schema_7 | *{
		fileMatch: ["(^|/)project\\.clj$"]
		versioning: "maven"
		...
	}

	// Configuration for lock file maintenance.
	lockFileMaintenance?: _schema_23 | *{
		enabled:             false
		recreateWhen:        "always"
		rebaseStalePrs:      true
		branchTopic:         "lock-file-maintenance"
		commitMessageAction: "Lock file maintenance"
		commitMessageTopic:  null
		commitMessageExtra:  null
		schedule: ["before 4am on monday"]
		groupName: null
		prBodyDefinitions: {
			Change: "All locks refreshed"
			...
		}
		...
	}

	// Add a global or per-repo log context to each log entry.
	logContext?: string | *null

	// Log file path.
	logFile?: string

	// Set the log file log level.
	logFileLevel?: string | *"debug"

	// Remap log levels to different levels.
	logLevelRemap?: [...{
		description?: [...string] | string

		// Regex/minimatch expression to match against log message.
		matchMessage?: string

		// New log level to use if matchMessage matches.
		newLogLevel?: "trace" | "debug" | "info" | "warn" | "error" | "fatal"
		...
	}]

	// Configuration to apply when an update type is `major`.
	major?: _schema_2CC | *{
		...
	}

	// Configuration object for the maven manager
	maven?: _schema_CD | *{
		fileMatch: ["(^|/|\\.)pom\\.xml$", "^(((\\.mvn)|(\\.m2))/)?settings\\.xml$"]
		versioning: "maven"
		...
	}

	// Configuration object for the maven-wrapper manager
	"maven-wrapper"?: _schema_16 | *{
		fileMatch: ["(^|\\/).mvn/wrapper/maven-wrapper.properties$"]
		versioning: "maven"
		...
	}

	// Configuration object for the meteor manager
	meteor?: _schema_AC | *{
		fileMatch: ["(^|/)package\\.js$"]
		...
	}

	// Define presets here which have been removed or renamed and
	// should be migrated automatically.
	migratePresets?: _schema_71 & {
		[string]: string
	} | *{
		...
	}

	// The number of a milestone. If set, the milestone will be set
	// when Renovate creates the PR.
	milestone?: int | *null

	// Time required before a new release is considered stable.
	minimumReleaseAge?: string | *null

	// Configuration to apply when an update type is `minor`.
	minor?: _schema_3E8 | *{
		...
	}

	// Configuration object for the mint manager
	mint?: _schema_E00 | *{
		fileMatch: ["(^|/)Mintfile$"]
		...
	}

	// Configuration object for the mix manager
	mix?: _schema_6F | *{
		fileMatch: ["(^|/)mix\\.exs$"]
		versioning: "hex"
		...
	}

	// Configuration object for the nix manager
	nix?: _schema_B1B | *{
		fileMatch: ["(^|/)flake\\.nix$"]
		commitMessageTopic: "nixpkgs"
		commitMessageExtra: "to {{newValue}}"
		enabled:            false
		...
	}

	// Configuration object for the nodenv manager
	nodenv?: _schema_32 | *{
		fileMatch: ["(^|/)\\.node-version$"]
		versioning: "node"
		...
	}

	// Configuration object for the npm manager
	npm?: _schema_61 | *{
		fileMatch: ["(^|/)package\\.json$"]
		digest: {
			prBodyDefinitions: {
				Change: "{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}"
				...
			}
			...
		}
		prBodyDefinitions: {
			Change: "[{{#if displayFrom}}`{{{displayFrom}}}` -> {{else}}{{#if currentValue}}`{{{currentValue}}}` -> {{/if}}{{/if}}{{#if displayTo}}`{{{displayTo}}}`{{else}}`{{{newValue}}}`{{/if}}]({{#if depName}}https://renovatebot.com/diffs/npm/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}{{/if}})"
			...
		}
		...
	}

	// npm token used to authenticate with the default registry.
	npmToken?: string

	// String copy of `.npmrc` file. Use `\n` instead of line breaks.
	npmrc?: string

	// Whether to merge `config.npmrc` with repo `.npmrc` content if
	// both are found.
	npmrcMerge?: bool | *false

	// Configuration object for the nuget manager
	nuget?: _schema_D47 | *{
		fileMatch: ["\\.(?:cs|fs|vb)proj$", "\\.(?:props|targets)$", "(^|/)dotnet-tools\\.json$", "(^|/)global\\.json$"]
		...
	}

	// Configuration object for the nvm manager
	nvm?: _schema_5C | *{
		fileMatch: ["(^|/)\\.nvmrc$"]
		versioning: "node"
		pinDigests: false
		...
	}

	// Configuration object for the ocb manager
	ocb?: _schema_4B | *{
		fileMatch:
		[]
		...
	}

	// Require a Configuration PR first.
	onboarding?: bool

	// Change this value to override the default onboarding branch
	// name.
	onboardingBranch?: string | *"renovate/configure"

	// Change this value to override the default onboarding commit
	// message.
	onboardingCommitMessage?: string | *null

	// Configuration to use for onboarding PRs.
	onboardingConfig?: _schema_A28 | *{
		$schema: "https://docs.renovatebot.com/renovate-schema.json"
		...
	}

	// Change this value to override the default onboarding config
	// file name.
	onboardingConfigFileName?: string | *"renovate.json"

	// Onboard the repository even if no dependencies are found.
	onboardingNoDeps?: bool | *false

	// Change this value to override the default onboarding PR title.
	onboardingPrTitle?: string | *"Configure Renovate"

	// Set to enable rebase/retry markdown checkbox for onboarding
	// PRs.
	onboardingRebaseCheckbox?: bool | *false

	// Set to `true` to perform a check for disabled config prior to
	// cloning.
	optimizeForDisabled?: bool | *false

	// Configuration object for the osgi manager
	osgi?: _schema_39B | *{
		fileMatch: ["(^|/)src/main/features/.+\\.json$"]
		...
	}

	// Use vulnerability alerts from `osv.dev`.
	osvVulnerabilityAlerts?: bool | *false

	// Rules for matching packages.
	packageRules?: [...{
		description?: [...string] | string

		// A version range or regex pattern capturing allowed versions for
		// dependencies.
		allowedVersions?: string

		// If set, Renovate will use this URL to fetch changelogs for a
		// matched dependency. Valid only within a `packageRules` object.
		customChangelogUrl?: string

		// Dep names to exclude. Valid only within a `packageRules`
		// object.
		excludeDepNames?: [...string] | string

		// Dep name patterns to exclude. Valid only within a
		// `packageRules` object.
		excludeDepPatterns?: [...string] | string

		// Package names to exclude. Valid only within a `packageRules`
		// object.
		excludePackageNames?: [...string] | string

		// Package name patterns to exclude. Valid only within a
		// `packageRules` object.
		excludePackagePatterns?: [...string] | string

		// Package name prefixes to exclude. Valid only within a
		// `packageRules` object.
		excludePackagePrefixes?: [...string] | string

		// List of repositories to exclude (e.g. `["**/*-archived"]`).
		// Valid only within a `packageRules` object.
		excludeRepositories?: [...string] | string

		// List of strings containing exact matches (e.g. `["main"]`)
		// and/or regex expressions (e.g. `["/^release/.*/"]`). Valid
		// only within a `packageRules` object.
		matchBaseBranches?: [...string] | string

		// List of categories to match (for example: `["python"]`). Valid
		// only within a `packageRules` object.
		matchCategories?: [...string] | string

		// Merge confidence levels to match against (`low`, `neutral`,
		// `high`, `very high`). Valid only within `packageRules` object.
		matchConfidence?: [..."low" | "neutral" | "high" | "very high"] | ("low" | "neutral" | "high" | "very high")

		// Matches the current age of the package derived from its release
		// timestamp. Valid only within a `packageRules` object.
		matchCurrentAge?: string

		// A regex to match against the raw `currentValue` string of a
		// dependency. Valid only within a `packageRules` object.
		matchCurrentValue?: string

		// A version, or range of versions, to match against the current
		// version of a package. Valid only within a `packageRules`
		// object.
		matchCurrentVersion?: string

		// List of datasources to match (e.g. `["orb"]`). Valid only
		// within a `packageRules` object.
		matchDatasources?: [...string] | string

		// Dep names to match. Valid only within a `packageRules` object.
		matchDepNames?: [...string] | string

		// Dep name patterns to match. Valid only within a `packageRules`
		// object.
		matchDepPatterns?: [...string] | string

		// List of depTypes to match (e.g. [`peerDependencies`]). Valid
		// only within `packageRules` object.
		matchDepTypes?: [...string] | string

		// List of strings to do an exact match against package and lock
		// files with full path. Only works inside a `packageRules`
		// object.
		matchFileNames?: [...string]

		// List of package managers to match (e.g. `["pipenv"]`). Valid
		// only within a `packageRules` object.
		matchManagers?: [...string] | string

		// A regex to match against the raw `newValue` string of a
		// dependency. Valid only within a `packageRules` object.
		matchNewValue?: string

		// Package names to match. Valid only within a `packageRules`
		// object.
		matchPackageNames?: [...string] | string

		// Package name patterns to match. Valid only within a
		// `packageRules` object.
		matchPackagePatterns?: [...string] | string

		// Package name prefixes to match. Valid only within a
		// `packageRules` object.
		matchPackagePrefixes?: [...string] | string

		// List of repositories to match (e.g. `["**/*-archived"]`). Valid
		// only within a `packageRules` object.
		matchRepositories?: [...string] | string

		// A list of source URL prefixes to match against, commonly used
		// to group monorepos or packages from the same organization.
		matchSourceUrlPrefixes?: [...string] | string

		// A list of source URLs to exact match against.
		matchSourceUrls?: [...string] | string

		// Update types to match against (`major`, `minor`, `pin`,
		// `pinDigest`, etc). Valid only within `packageRules` object.
		matchUpdateTypes?: [..."major" | "minor" | "patch" | "pin" | "pinDigest" | "digest" | "lockFileMaintenance" | "rollback" | "bump" | "replacement"] | ("major" | "minor" | "patch" | "pin" | "pinDigest" | "digest" | "lockFileMaintenance" | "rollback" | "bump" | "replacement")

		// The name of the new dependency that replaces the old deprecated
		// dependency.
		replacementName?: string

		// Controls what the replacement package name.
		replacementNameTemplate?: string | *"{{{packageName}}}"

		// The version of the new dependency that replaces the old
		// deprecated dependency.
		replacementVersion?: string
		...
	}]

	// Password for authentication.
	password?: string

	// Configuration to apply when an update type is `patch`.
	patch?: _schema_B8 | *{
		...
	}

	// Configuration object for the pep621 manager
	pep621?: _schema_BA | *{
		fileMatch: ["(^|/)pyproject\\.toml$"]
		...
	}

	// If set to `true`: keep repository data between runs instead of
	// deleting the data.
	persistRepoData?: bool | *false

	// Configuration to apply when an update type is `pin`.
	pin?: _schema_B7 | *{
		rebaseWhen:          "behind-base-branch"
		groupName:           "Pin Dependencies"
		groupSlug:           "pin-dependencies"
		commitMessageAction: "Pin"
		group: {
			commitMessageTopic: "dependencies"
			commitMessageExtra: ""
			...
		}
		...
	}

	// Configuration to apply when pinning a digest (no change in
	// tag/version).
	pinDigest?: _schema_32E | *{
		groupName:           "Pin Dependencies"
		groupSlug:           "pin-dependencies"
		commitMessageAction: "Pin"
		group: {
			commitMessageTopic: "dependencies"
			commitMessageExtra: ""
			...
		}
		...
	}

	// Whether to add digests to Dockerfile source images.
	pinDigests?: bool | *false

	// Configuration object for the pip-compile manager
	"pip-compile"?: _schema_49 | *{
		fileMatch: []
		lockFileMaintenance: {
			enabled:             true
			branchTopic:         "pip-compile-refresh"
			commitMessageAction: "Refresh pip-compile outputs"
			...
		}
		...
	}

	// Configuration object for the pip_requirements manager
	pip_requirements?: _schema_5D | *{
		fileMatch: ["(^|/)[\\w-]*requirements(-\\w+)?\\.(txt|pip)$"]
		...
	}

	// Configuration object for the pip_setup manager
	pip_setup?: _schema_FC | *{
		fileMatch: ["(^|/)setup\\.py$"]
		...
	}

	// Configuration object for the pipenv manager
	pipenv?: _schema_3BD | *{
		fileMatch: ["(^|/)Pipfile$"]
		...
	}

	// Platform type of repository.
	platform?: "azure" | "bitbucket" | "bitbucket-server" | "codecommit" | "gerrit" | "gitea" | "github" | "gitlab" | "local" | *"github"

	// Controls if platform-native auto-merge is used.
	platformAutomerge?: bool | *true

	// Use platform API to perform commits instead of using Git
	// directly.
	platformCommit?: bool | *false

	// Configuration object for the poetry manager
	poetry?: _schema_CA | *{
		fileMatch: ["(^|/)pyproject\\.toml$"]
		...
	}

	// Enable post-update options to be run after package/artifact
	// updating.
	postUpdateOptions?: [..."bundlerConservative" | "gomodMassage" | "gomodTidy" | "gomodTidy1.17" | "gomodTidyE" | "gomodUpdateImportPaths" | "helmUpdateSubChartArchives" | "npmDedupe" | "pnpmDedupe" | "yarnDedupeFewer" | "yarnDedupeHighest"]

	// Post-upgrade tasks that are executed before a commit is made by
	// Renovate.
	postUpgradeTasks?: _schema_5DB9 & [...{
		description?: [...string] | string

		// A list of post-upgrade commands that are executed before a
		// commit is made by Renovate.
		commands?: [...string]

		// Controls when the post upgrade tasks run: on every update, or
		// once per upgrade branch.
		executionMode?: "update" | "branch" | *"update"

		// Files that match the glob pattern will be committed after
		// running a post-upgrade task.
		fileFilters?: [...string] | *["**/*"]
		...
	}] | *{
		commands: []
		fileFilters: []
		executionMode: "update"
		...
	}

	// List of columns to use in PR bodies.
	prBodyColumns?: [...string] | *["Package", "Type", "Update", "Change", "Pending"]

	// Table column definitions to use in PR tables.
	prBodyDefinitions?: {
		...
	} | *{
		Package:         "{{{depNameLinked}}}"
		Type:            "{{{depType}}}"
		Update:          "{{{updateType}}}"
		"Current value": "{{{currentValue}}}"
		"New value":     "{{{newValue}}}"
		Change:          "`{{{displayFrom}}}` -> `{{{displayTo}}}`"
		Pending:         "{{{displayPending}}}"
		References:      "{{{references}}}"
		"Package file":  "{{{packageFile}}}"
		Age:             "{{#if newVersion}}[![age](https://developer.mend.io/api/mc/badges/age/{{datasource}}/{{replace '/' '%2f' depName}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}"
		Adoption:        "{{#if newVersion}}[![adoption](https://developer.mend.io/api/mc/badges/adoption/{{datasource}}/{{replace '/' '%2f' depName}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}"
		Passing:         "{{#if newVersion}}[![passing](https://developer.mend.io/api/mc/badges/compatibility/{{datasource}}/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}"
		Confidence:      "{{#if newVersion}}[![confidence](https://developer.mend.io/api/mc/badges/confidence/{{datasource}}/{{replace '/' '%2f' depName}}/{{{currentVersion}}}/{{{newVersion}}}?slim=true)](https://docs.renovatebot.com/merge-confidence/){{/if}}"
		...
	}

	// List of extra notes or templates to include in the Pull Request
	// body.
	prBodyNotes?: [...string] | string | *[]

	// Pull Request body template. Controls which sections are
	// rendered in the body of the pull request.
	prBodyTemplate?: string | *"{{{header}}}{{{table}}}{{{warnings}}}{{{notes}}}{{{changelogs}}}{{{configDescription}}}{{{controls}}}{{{footer}}}"

	// Set the maximum number of commits per Renovate run. By default
	// there is no limit.
	prCommitsPerRunLimit?: int | *0

	// Limit to a maximum of x concurrent branches/PRs. 0 means no
	// limit.
	prConcurrentLimit?: int | *10

	// When to create the PR for a branch.
	prCreation?: "immediate" | "not-pending" | "status-success" | "approval" | *"immediate"

	// Text added here will be placed last in the PR body, with a
	// divider separator before it.
	prFooter?: string | *"This PR has been generated by [Renovate Bot](https://github.com/renovatebot/renovate)."

	// Text added here will be placed first in the PR body.
	prHeader?: string

	// Rate limit PRs to maximum x created per hour. 0 means no limit.
	prHourlyLimit?: int | *2

	// Timeout in hours for when `prCreation=not-pending`.
	prNotPendingHours?: int | *25

	// Set sorting priority for PR creation. PRs with higher priority
	// are created first, negative priority last.
	prPriority?: int | *0

	// Pull Request title template (deprecated). Inherits from
	// `commitMessage` if null.
	prTitle?: string | *null

	// Whether to bypass appending extra context to the Pull Request
	// title.
	prTitleStrict?: bool | *false

	// Configuration object for the pre-commit manager
	"pre-commit"?: _schema_E7 | *{
		commitMessageTopic: "pre-commit hook {{depName}}"
		enabled:            false
		fileMatch: ["(^|/)\\.pre-commit-config\\.ya?ml$"]
		prBodyNotes: ["Note: The `pre-commit` manager in Renovate is not supported by the `pre-commit` maintainers or community. Please do not report any problems there, instead [create a Discussion in the Renovate repository](https://github.com/renovatebot/renovate/discussions/new) if you have any questions."]
		...
	}

	// Cache resolved presets in package cache.
	presetCachePersistence?: bool | *false

	// If enabled, Renovate logs the fully resolved config for each
	// repository, plus the fully resolved presets.
	printConfig?: bool | *false

	// Server-side private key.
	privateKey?: string

	// Secondary or old private key to try.
	privateKeyOld?: string

	// Path to the Server-side private key.
	privateKeyPath?: string

	// Path to the Server-side old private key.
	privateKeyPathOld?: string

	// Links which are used in PRs, issues and comments.
	productLinks?: _schema_39 & {
		[string]: string
	} | *{
		documentation: "https://docs.renovatebot.com/"
		help:          "https://github.com/renovatebot/renovate/discussions"
		homepage:      "https://github.com/renovatebot/renovate"
		...
	}

	// Set to `true` to enable branch pruning after automerging.
	pruneBranchAfterAutomerge?: bool | *true

	// Set to `false` to disable pruning stale branches.
	pruneStaleBranches?: bool | *true

	// Configuration object for the pub manager
	pub?: _schema_18 | *{
		fileMatch: ["(^|/)pubspec\\.ya?ml$"]
		versioning: "npm"
		...
	}

	// Configuration object for the puppet manager
	puppet?: _schema_84 | *{
		fileMatch: ["(^|/)Puppetfile$"]
		...
	}

	// Configuration object for the pyenv manager
	pyenv?: _schema_9E | *{
		fileMatch: ["(^|/)\\.python-version$"]
		versioning: "docker"
		pinDigests: false
		...
	}

	// Determines how to modify or update existing ranges.
	rangeStrategy?: "auto" | "pin" | "bump" | "replace" | "widen" | "update-lockfile" | "in-range-only" | *"auto"

	// Label to request a rebase from Renovate bot.
	rebaseLabel?: string | *"rebase"

	// Controls when Renovate rebases an existing branch.
	rebaseWhen?: "auto" | "never" | "conflicted" | "behind-base-branch" | *"auto"

	// Recreate PRs even if same ones were closed previously.
	recreateWhen?: "auto" | "always" | "never" | *"auto"

	// Key prefix for redis cache entries.
	redisPrefix?: string

	// If set, this Redis URL will be used for caching instead of the
	// file system.
	redisUrl?: string

	// Configuration object for the regex manager
	regex?: _schema_90 | *{
		pinDigests: false
		...
	}

	// Aliases for registries.
	registryAliases?: _schema_1D1 & {
		[string]: string
	} | *{
		...
	}

	// List of URLs to try for dependency lookup. Package manager
	// specific.
	registryUrls?: [...string] | *null

	// Configuration to apply when replacing a dependency.
	replacement?: _schema_7A | *{
		branchTopic:         "{{{depNameSanitized}}}-replacement"
		commitMessageAction: "Replace"
		commitMessageExtra:  "with {{newName}} {{#if isMajor}}{{{prettyNewMajor}}}{{else}}{{#if isSingleVersion}}{{{prettyNewVersion}}}{{else}}{{{newValue}}}{{/if}}{{/if}}"
		prBodyNotes: ["This is a special PR that replaces `{{{depName}}}` with the community suggested minimal stable replacement version."]
		...
	}

	// List of Repositories.
	repositories?: [...string]

	// This option decides if Renovate uses a JSON cache to speed up
	// extractions.
	repositoryCache?: "disabled" | "enabled" | "reset" | *"disabled"

	// Set the type of renovate repository cache if `repositoryCache`
	// is enabled.
	repositoryCacheType?: string | *"local"

	// Controls Renovate's behavior regarding repository config files
	// such as `renovate.json`.
	requireConfig?: "required" | "optional" | "ignored" | *"required"

	// Ignore versions newer than npm "latest" version.
	respectLatest?: bool | *true

	// Requested reviewers for Pull Requests (either username or email
	// address depending on the platform).
	reviewers?: [...string]

	// Determine reviewers based on configured code owners and changes
	// in PR.
	reviewersFromCodeOwners?: bool | *false

	// Take a random sample of given size from `reviewers`.
	reviewersSampleSize?: int | *null

	// Configuration to apply when rolling back a version.
	rollback?: _schema_D4 | *{
		branchTopic:         "{{{depNameSanitized}}}-rollback"
		commitMessageAction: "Roll back"
		semanticCommitType:  "fix"
		...
	}

	// Create PRs to roll back versions if the current version is not
	// found in the registry.
	rollbackPrs?: bool | *false

	// Configuration object for the ruby-version manager
	"ruby-version"?: _schema_94 | *{
		fileMatch: ["(^|/)\\.ruby-version$"]
		versioning: "ruby"
		...
	}

	// Configuration object for the sbt manager
	sbt?: _schema_44 | *{
		fileMatch: ["\\.sbt$", "project/[^/]*\\.scala$", "project/build\\.properties$", "(^|/)repositories$"]
		versioning: "ivy"
		...
	}

	// Limit branch creation to these times of day or week.
	schedule?: [...string] | string | *["at any time"]

	// Object which holds secret name/value pairs.
	secrets?: _schema_48D & {
		[string]: string
	} | *{
		...
	}

	// Commit scope to use if Semantic Commits are enabled.
	semanticCommitScope?: string | *"deps"

	// Commit type to use if Semantic Commits is enabled.
	semanticCommitType?: string | *"chore"

	// Enable Semantic Commit prefixes for commits and PR titles.
	semanticCommits?: "auto" | "enabled" | "disabled" | *"auto"

	// If set to `false`, Renovate will upgrade dependencies to their
	// latest release only. Renovate will not separate major or minor
	// branches.
	separateMajorMinor?: bool | *true

	// If set to `true`, Renovate will separate `minor` and `patch`
	// updates into separate branches.
	separateMinorPatch?: bool | *false

	// If set to `true`, PRs will be raised separately for each
	// available `major` upgrade version.
	separateMultipleMajor?: bool | *false

	// Configuration object for the setup-cfg manager
	"setup-cfg"?: _schema_1A | *{
		fileMatch: ["(^|/)setup\\.cfg$"]
		versioning: "pep440"
		...
	}

	// Skip installing modules/dependencies if lock file updating is
	// possible without a full install.
	skipInstalls?: bool | *null

	// Custom strings to use as status check names.
	statusCheckNames?: _schema_D05 | *{
		artifactError:     "renovate/artifacts"
		configValidation:  "renovate/config-validation"
		mergeConfidence:   "renovate/merge-confidence"
		minimumReleaseAge: "renovate/stability-days"
		...
	}

	// Label to make Renovate stop updating a PR.
	stopUpdatingLabel?: string | *"stop-updating"

	// Options to suppress various types of warnings and other
	// notifications.
	suppressNotifications?: [..."artifactErrors" | "branchAutomergeFailure" | "configErrorIssue" | "dependencyLookupWarnings" | "deprecationWarningIssues" | "lockFileErrors" | "missingCredentialsError" | "onboardingClose" | "prEditedNotification" | "prIgnoreNotification"] | *["deprecationWarningIssues"]

	// Configuration object for the swift manager
	swift?: _schema_A4 | *{
		fileMatch: ["(^|/)Package\\.swift"]
		versioning: "swift"
		pinDigests: false
		...
	}

	// Configuration object for the tekton manager
	tekton?: _schema_C6A | *{
		fileMatch:
		[]
		...
	}

	// Configuration object for the terraform manager
	terraform?: _schema_80 | *{
		commitMessageTopic: "Terraform {{depName}}"
		fileMatch: ["\\.tf$"]
		pinDigests: false
		...
	}

	// Configuration object for the terraform-version manager
	"terraform-version"?: _schema_3F | *{
		fileMatch: ["(^|/)\\.terraform-version$"]
		versioning:     "hashicorp"
		extractVersion: "^v(?<version>.*)$"
		...
	}

	// Configuration object for the terragrunt manager
	terragrunt?: _schema_B4 | *{
		commitMessageTopic: "Terragrunt dependency {{depName}}"
		fileMatch: ["(^|/)terragrunt\\.hcl$"]
		...
	}

	// Configuration object for the terragrunt-version manager
	"terragrunt-version"?: _schema_8E | *{
		fileMatch: ["(^|/)\\.terragrunt-version$"]
		versioning:     "hashicorp"
		extractVersion: "^v(?<version>.+)$"
		...
	}

	// Configuration object for the tflint-plugin manager
	"tflint-plugin"?: _schema_8D | *{
		commitMessageTopic: "TFLint plugin {{depName}}"
		fileMatch: ["\\.tflint\\.hcl$"]
		extractVersion: "^v(?<version>.*)$"
		...
	}

	// Must conform to [IANA Time
	// Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
	// format.
	timezone?: string

	// Repository Auth Token.
	token?: string

	// Enable remediation of transitive dependencies.
	transitiveRemediation?: bool | *false

	// Configuration object for the travis manager
	travis?: _schema_C7 | *{
		fileMatch: ["^\\.travis\\.ya?ml$"]
		major: {
			enabled: false
			...
		}
		versioning: "node"
		...
	}

	// Enable or disable Unicode emoji.
	unicodeEmoji?: bool | *true

	// Whether to update internal dep versions in a monorepo. Works on
	// Yarn Workspaces.
	updateInternalDeps?: bool | *false

	// Set to `false` to disable lock file updating.
	updateLockFiles?: bool | *true

	// Whether to update branches when not scheduled. Renovate will
	// not create branches outside of the schedule.
	updateNotScheduled?: bool | *true

	// Whether to update pinned (single version) dependencies or not.
	updatePinnedDependencies?: bool | *true

	// Whether to read configuration from `baseBranches` instead of
	// only the default branch.
	useBaseBranchConfig?: "merge" | "none" | *"none"

	// If `false`, Renovate does not try to access cloud metadata
	// services.
	useCloudMetadataServices?: bool | *true

	// User-facing strings for the Renovate comment when a PR is
	// closed.
	userStrings?: {
		...
	} | *{
		ignoreTopic:  "Renovate Ignore Notification"
		ignoreMajor:  "Because you closed this PR without merging, Renovate will ignore this update. You will not get PRs for *any* future `{{{newMajor}}}.x` releases. But if you manually upgrade to `{{{newMajor}}}.x` then Renovate will re-enable `minor` and `patch` updates automatically."
		ignoreDigest: "Because you closed this PR without merging, Renovate will ignore this update. You will not get PRs for the `{{{depName}}}` `{{{newDigestShort}}}` update again."
		ignoreOther:  "Because you closed this PR without merging, Renovate will ignore this update (`{{{newValue}}}`). You will get a PR once a newer version is released. To ignore this dependency forever, add it to the `ignoreDeps` array of your Renovate config."
		...
	}

	// Username for authentication.
	username?: string

	// Configuration object for the velaci manager
	velaci?: _schema_4F7 | *{
		fileMatch: ["(^|/)\\.vela\\.ya?ml$"]
		...
	}

	// A regex (`re2`) with named capture groups to show how version
	// and compatibility are split from a raw version string.
	versionCompatibility?: string

	// Versioning to use for filtering and comparisons.
	versioning?: "aws-machine-image" | "azure-rest-api" | "bazel-module" | "cargo" | "composer" | "conan" | "deb" | "debian" | "docker" | "git" | "go-mod-directive" | "gradle" | "hashicorp" | "helm" | "hermit" | "hex" | "ivy" | "kubernetes-api" | "loose" | "maven" | "nixpkgs" | "node" | "npm" | "nuget" | "pep440" | "perl" | "poetry" | "python" | "redhat" | "regex" | "rez" | "rpm" | "ruby" | "semver" | "semver-coerced" | "swift" | "ubuntu" | =~"^regex:"

	// Config to apply when a PR is needed due to a vulnerability in
	// the existing package version.
	vulnerabilityAlerts?: _schema_B6 | *{
		groupName: null
		schedule: []
		dependencyDashboardApproval: false
		minimumReleaseAge:           null
		rangeStrategy:               "update-lockfile"
		commitMessageSuffix:         "[SECURITY]"
		branchTopic:                 "{{{datasource}}}-{{{depName}}}-vulnerability"
		prCreation:                  "immediate"
		...
	}

	// Configuration object for the woodpecker manager
	woodpecker?: _schema_B2E | *{
		fileMatch: ["^\\.woodpecker(?:/[^/]+)?\\.ya?ml$"]
		...
	}

	// Writes discovered repositories to a JSON file and then exit.
	writeDiscoveredRepos?: string
	...
}

let _schema_1 = _schema

let _schema_5 = _schema

let _schema_A = _schema

let _schema_8 = _schema

let _schema_E = _schema

let _schema_B = _schema

let _schema_36 = _schema

let _schema_9 = _schema

let _schema_3 = _schema

let _schema_A2 = _schema

let _schema_F = _schema

let _schema_D0 = _schema

let _schema_EF = _schema

let _schema_0 = _schema

let _schema_34 = _schema

let _schema_8B = _schema

let _schema_38 = _schema

let _schema_2 = _schema

let _schema_DB = _schema

let _schema_3D = _schema

let _schema_C = _schema

let _schema_DD = _schema

let _schema_44D = _schema

let _schema_FA = _schema

let _schema_9F = _schema

let _schema_EE = _schema

let _schema_C2 = _schema

let _schema_B5 = _schema

let _schema_F9 = _schema

let _schema_E2 = _schema

let _schema_82 = _schema

let _schema_4 = _schema

let _schema_B49 = _schema

let _schema_A9 = _schema

let _schema_DF = _schema

let _schema_ED = _schema

let _schema_CBE = _schema

let _schema_C3 = _schema

let _schema_74 = _schema

let _schema_E1 = _schema

let _schema_6 = _schema

let _schema_C1 = _schema

let _schema_62 = _schema

let _schema_2C = _schema

let _schema_28 = _schema

let _schema_D = _schema

let _schema_46 = _schema

let _schema_F2 = _schema

let _schema_21C = _schema

let _schema_45 = _schema

let _schema_C5 = _schema

let _schema_1F = _schema

let _schema_83 = _schema

let _schema_95 = _schema

let _schema_11 = _schema

let _schema_F4 = _schema

let _schema_25 = _schema

let _schema_7F = _schema

let _schema_66A = _schema

let _schema_A7 = _schema

let _schema_88 = _schema

let _schema_1E = _schema

let _schema_42 = _schema

let _schema_7 = _schema

let _schema_23 = _schema

let _schema_2CC = _schema

let _schema_CD = _schema

let _schema_16 = _schema

let _schema_AC = _schema

let _schema_71 = _schema

let _schema_3E8 = _schema

let _schema_E00 = _schema

let _schema_6F = _schema

let _schema_B1B = _schema

let _schema_32 = _schema

let _schema_61 = _schema

let _schema_D47 = _schema

let _schema_5C = _schema

let _schema_4B = _schema

let _schema_A28 = _schema

let _schema_39B = _schema

let _schema_B8 = _schema

let _schema_BA = _schema

let _schema_B7 = _schema

let _schema_32E = _schema

let _schema_49 = _schema

let _schema_5D = _schema

let _schema_FC = _schema

let _schema_3BD = _schema

let _schema_CA = _schema

let _schema_5DB9 = _schema

let _schema_E7 = _schema

let _schema_39 = _schema

let _schema_18 = _schema

let _schema_84 = _schema

let _schema_9E = _schema

let _schema_90 = _schema

let _schema_1D1 = _schema

let _schema_7A = _schema

let _schema_D4 = _schema

let _schema_94 = _schema

let _schema_44 = _schema

let _schema_48D = _schema

let _schema_1A = _schema

let _schema_D05 = _schema

let _schema_A4 = _schema

let _schema_C6A = _schema

let _schema_80 = _schema

let _schema_3F = _schema

let _schema_B4 = _schema

let _schema_8E = _schema

let _schema_8D = _schema

let _schema_C7 = _schema

let _schema_4F7 = _schema

let _schema_B6 = _schema

let _schema_B2E = _schema
