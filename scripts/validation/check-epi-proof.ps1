param(
    [string]$FshPath = (Join-Path $PSScriptRoot '..\..\fsh\input\fsh\epi-dosage-example.fsh'),
    [string]$JsonPath = (Join-Path $PSScriptRoot '..\..\docs\source\data\epi-dosage-example.json')
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $FshPath)) {
    throw "FSH source not found: $FshPath"
}

if (-not (Test-Path $JsonPath)) {
    throw "JSON evidence not found: $JsonPath"
}

$fshContent = Get-Content $FshPath -Raw
$jsonContent = Get-Content $JsonPath -Raw | ConvertFrom-Json

$expectedRequirementCodes = @('REQ-EPI-001', 'REQ-EPI-002')
$expectedSectionTitle = '4.2 Dosage and administration'
$expectedLeafletFragments = @(
    'Adults take 1 tablet twice daily after meals.',
    'Swallow with water and take at regular intervals.',
    'Do not exceed 2 tablets per day unless prescribed.'
)

if ($jsonContent.resourceType -ne 'Composition') {
    throw "Expected resourceType Composition, got '$($jsonContent.resourceType)'"
}

if ($jsonContent.section.Count -lt 1) {
    throw 'Expected at least one section in the JSON evidence.'
}

if ($jsonContent.section[0].title -ne $expectedSectionTitle) {
    throw "Unexpected section title: '$($jsonContent.section[0].title)'"
}

foreach ($code in $expectedRequirementCodes) {
    if ($fshContent -notmatch [regex]::Escape($code)) {
        throw "FSH source does not contain expected requirement code '$code'."
    }

    if (($jsonContent.meta.tag | Where-Object { $_.code -eq $code }).Count -lt 1) {
        throw "JSON evidence does not contain expected requirement code '$code'."
    }
}

if ($fshContent -notmatch [regex]::Escape($expectedSectionTitle)) {
    throw "FSH source does not contain expected section title '$expectedSectionTitle'."
}

foreach ($fragment in $expectedLeafletFragments) {
    if ($fshContent -notmatch [regex]::Escape($fragment)) {
        throw "FSH source does not contain expected text fragment: '$fragment'"
    }

    if ($jsonContent.section[0].text.div -notmatch [regex]::Escape($fragment)) {
        throw "JSON evidence does not contain expected text fragment: '$fragment'"
    }
}

Write-Host 'ePI proof-of-concept source and evidence are in sync.'