# FHIR IG Project Setup Guide

This guide describes how to create and work with the same FHIR IG project scaffold used in this repository.

## Goal

Use FSH as the source of truth, generate FHIR JSON with SUSHI, validate generated resources with Firely Terminal, review changes in GitHub Pull Requests, and let Simplifier import only generated JSON from the reviewed `main` branch.

## Prerequisites

Install:

- VS Code
- Git
- Node.js 20 or newer
- Java 17 or 21 LTS for IG Publisher
- Firely Terminal

Install project dependencies:

```powershell
npm install
```

## Folder Structure

Use this structure:

```text
.
├── input/
│   ├── fsh/
│   │   ├── codesystems/
│   │   ├── extensions/
│   │   ├── instances/
│   │   ├── invariants/
│   │   ├── mappings/
│   │   ├── profiles/
│   │   ├── valuesets/
│   │   └── aliases.fsh
│   └── pagecontent/
├── fsh-generated/
│   └── resources/
├── scripts/
├── .github/
│   └── workflows/
├── sushi-config.yaml
├── ig.ini
├── package.json
├── package-list.json
└── README.md
```

## Source And Generated Files

Source files:

```text
input/fsh/**/*.fsh
input/pagecontent/**/*.md
sushi-config.yaml
ig.ini
package-list.json
scripts/*.ps1
```

Generated files committed to Git:

```text
fsh-generated/resources/*.json
```

Generated/local files not committed:

```text
node_modules/
input-cache/
output/
temp/
template/
.firely-validation/
fsh-generated/data/
fsh-generated/includes/
fsh-generated/fsh-index.txt
```

Simplifier should import only:

```text
fsh-generated/resources/*.json
```

from the `main` branch.

## Create The Scaffold

Create folders:

```powershell
New-Item -ItemType Directory -Force -Path `
  input/fsh/codesystems, `
  input/fsh/extensions, `
  input/fsh/instances, `
  input/fsh/invariants, `
  input/fsh/mappings, `
  input/fsh/profiles, `
  input/fsh/valuesets, `
  input/pagecontent, `
  fsh-generated/resources, `
  scripts, `
  .github/workflows
```

Create or copy these project files:

```text
sushi-config.yaml
ig.ini
package.json
.gitignore
package-list.json
README.md
scripts/build-sushi.ps1
scripts/watch-sushi.ps1
scripts/validate-firely.ps1
scripts/build-ig.ps1
scripts/ci.ps1
.github/workflows/sushi-generation.yml
.github/workflows/firely-validation.yml
.github/workflows/pull-request-validation.yml
```

For an existing IG converted with GoFSH, copy the GoFSH output folders into:

```text
input/fsh/
```

Do not copy FSH source into:

```text
fsh-generated/resources/
```

That folder is SUSHI output.

## Configure FHIR Dependencies

Put FHIR package dependencies in `sushi-config.yaml`:

```yaml
dependencies:
  hl7.fhir.uv.extensions.r4: 5.2.0
  hl7.fhir.no.basis: 2.2.2
  hl7.terminology.r4: 7.1.0
```

Put Node tooling dependencies in `package.json`:

```json
{
  "devDependencies": {
    "fsh-sushi": "^3.16.5"
  }
}
```

## Build Commands

Generate JSON resources:

```powershell
.\scripts\build-sushi.ps1
```

Watch FSH files and regenerate automatically:

```powershell
.\scripts\watch-sushi.ps1
```

or:

```powershell
npm run watch
```

Validate generated JSON with Firely Terminal:

```powershell
.\scripts\validate-firely.ps1
```

Run local CI checks:

```powershell
.\scripts\ci.ps1
```

Generate the IG website:

```powershell
.\scripts\build-ig.ps1
```

## Daily Development Flow

1. Edit FSH source under `input/fsh`.
2. Save files in VS Code.
3. Run or keep running:

```powershell
npm run watch
```

4. Review generated JSON under `fsh-generated/resources`.
5. Run validation:

```powershell
.\scripts\validate-firely.ps1
```

6. Commit both source and generated JSON.

## Git Branch Flow

Initialize Git:

```powershell
git init
```

Create a feature branch:

```powershell
git checkout -b feature/fhir-ig-setup
```

Stage and commit:

```powershell
git add .
git commit -m "Add FHIR IG project structure"
```

Add GitHub remote:

```powershell
git remote add origin <your-github-repo-url>
```

Push the branch:

```powershell
git push -u origin feature/fhir-ig-setup
```

Open a Pull Request:

```text
feature/fhir-ig-setup -> main
```

After review and successful validation, merge to `main`.

## GitHub Actions

Use workflows for:

- SUSHI generation
- generated JSON freshness check
- Firely validation
- Pull Request validation

The PR validation should fail if generated JSON is not committed.

## Simplifier Setup

Configure Simplifier GitHub import:

```text
Branch: main
Include: fsh-generated/resources/*.json
```

Do not import:

```text
input/fsh/**
input/pagecontent/**
output/**
node_modules/**
input-cache/**
```

This ensures Simplifier only sees changes after GitHub Pull Request review and validation.

## Important Rules

- FSH is the source of truth.
- Generated JSON is committed because Simplifier imports it.
- Do not manually edit generated JSON.
- Do not place source FSH under `fsh-generated/resources`.
- Use Pull Requests before merging to `main`.
- Run Firely validation before merge.

