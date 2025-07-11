# NHL Team Logo Download Script
$teamLogos = @{
    'ANA' = 'https://www.sportslogos.net/logos/view/5320/Anaheim_Ducks/2023-24/Primary_Logo'
    'ARI' = 'https://www.sportslogos.net/logos/view/5321/Arizona_Coyotes/2023-24/Primary_Logo'
    'BOS' = 'https://www.sportslogos.net/logos/view/5322/Boston_Bruins/2023-24/Primary_Logo'
    'BUF' = 'https://www.sportslogos.net/logos/view/5323/Buffalo_Sabres/2023-24/Primary_Logo'
    'CGY' = 'https://www.sportslogos.net/logos/view/5324/Calgary_Flames/2023-24/Primary_Logo'
    'CAR' = 'https://www.sportslogos.net/logos/view/5325/Carolina_Hurricanes/2023-24/Primary_Logo'
    'CBJ' = 'https://www.sportslogos.net/logos/view/5326/Columbus_Blue_Jackets/2023-24/Primary_Logo'
    'CHI' = 'https://www.sportslogos.net/logos/view/5327/Chicago_Blackhawks/2023-24/Primary_Logo'
    'COL' = 'https://www.sportslogos.net/logos/view/5328/Colorado_Avalanche/2023-24/Primary_Logo'
    'DAL' = 'https://www.sportslogos.net/logos/view/5329/Dallas_Stars/2023-24/Primary_Logo'
    'DET' = 'https://www.sportslogos.net/logos/view/5330/Detroit_Red_Wings/2023-24/Primary_Logo'
    'EDM' = 'https://www.sportslogos.net/logos/view/5331/Edmonton_Oilers/2023-24/Primary_Logo'
    'FLA' = 'https://www.sportslogos.net/logos/view/5332/Florida_Panthers/2023-24/Primary_Logo'
    'LAK' = 'https://www.sportslogos.net/logos/view/5333/Los_Angeles_Kings/2023-24/Primary_Logo'
    'MIN' = 'https://www.sportslogos.net/logos/view/5334/Minnesota_Wild/2023-24/Primary_Logo'
    'MTL' = 'https://www.sportslogos.net/logos/view/5335/Montreal_Canadiens/2023-24/Primary_Logo'
    'NSH' = 'https://www.sportslogos.net/logos/view/5336/Nashville_Predators/2023-24/Primary_Logo'
    'NJD' = 'https://www.sportslogos.net/logos/view/5337/New_Jersey_Devils/2023-24/Primary_Logo'
    'NYI' = 'https://www.sportslogos.net/logos/view/5338/New_York_Islanders/2023-24/Primary_Logo'
    'NYR' = 'https://www.sportslogos.net/logos/view/5339/New_York_Rangers/2023-24/Primary_Logo'
    'OTT' = 'https://www.sportslogos.net/logos/view/5340/Ottawa_Senators/2023-24/Primary_Logo'
    'PHI' = 'https://www.sportslogos.net/logos/view/5341/Philadelphia_Flyers/2023-24/Primary_Logo'
    'PIT' = 'https://www.sportslogos.net/logos/view/5342/Pittsburgh_Penguins/2023-24/Primary_Logo'
    'SJS' = 'https://www.sportslogos.net/logos/view/5343/San_Jose_Sharks/2023-24/Primary_Logo'
    'SEA' = 'https://www.sportslogos.net/logos/view/5344/Seattle_Kraken/2023-24/Primary_Logo'
    'STL' = 'https://www.sportslogos.net/logos/view/5345/St_Louis_Blues/2023-24/Primary_Logo'
    'TBL' = 'https://www.sportslogos.net/logos/view/5346/Tampa_Bay_Lightning/2023-24/Primary_Logo'
    'TOR' = 'https://www.sportslogos.net/logos/view/5347/Toronto_Maple_Leafs/2023-24/Primary_Logo'
    'UTA' = 'https://www.sportslogos.net/logos/view/5348/Utah_Mammoth/2023-24/Primary_Logo'
    'VAN' = 'https://www.sportslogos.net/logos/view/5349/Vancouver_Canucks/2023-24/Primary_Logo'
    'VGK' = 'https://www.sportslogos.net/logos/view/5350/Vegas_Golden_Knights/2023-24/Primary_Logo'
    'WPG' = 'https://www.sportslogos.net/logos/view/5351/Winnipeg_Jets/2023-24/Primary_Logo'
    'WSH' = 'https://www.sportslogos.net/logos/view/5352/Washington_Capitals/2023-24/Primary_Logo'
}

# Create team_logos directory if it doesn't exist
if (!(Test-Path "team_logos")) {
    New-Item -ItemType Directory -Name "team_logos"
}

# Download each logo
foreach ($team in $teamLogos.Keys) {
    $url = $teamLogos[$team]
    $outputFile = "team_logos\$team.png"
    
    Write-Host "Downloading $team logo..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $outputFile -TimeoutSec 30
        Write-Host "Successfully downloaded $team logo"
    }
    catch {
        Write-Host "Failed to download $team logo: $($_.Exception.Message)"
    }
}

Write-Host "Logo download complete!" 