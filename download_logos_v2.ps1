# NHL Team Logo Download Script v2 - Using reliable image URLs
$teamLogos = @{
    'ANA' = 'https://upload.wikimedia.org/wikipedia/en/7/72/Anaheim_Ducks_logo.svg'
    'ARI' = 'https://upload.wikimedia.org/wikipedia/en/8/8a/Arizona_Coyotes_logo.svg'
    'BOS' = 'https://upload.wikimedia.org/wikipedia/en/1/12/Boston_Bruins.svg'
    'BUF' = 'https://upload.wikimedia.org/wikipedia/en/8/85/Buffalo_Sabres_logo.svg'
    'CGY' = 'https://upload.wikimedia.org/wikipedia/en/3/3c/Calgary_Flames_logo.svg'
    'CAR' = 'https://upload.wikimedia.org/wikipedia/en/8/8a/Carolina_Hurricanes_logo.svg'
    'CBJ' = 'https://upload.wikimedia.org/wikipedia/en/5/5d/Columbus_Blue_Jackets_logo.svg'
    'CHI' = 'https://upload.wikimedia.org/wikipedia/en/4/42/Chicago_Blackhawks_logo.svg'
    'COL' = 'https://upload.wikimedia.org/wikipedia/en/4/45/Colorado_Avalanche_logo.svg'
    'DAL' = 'https://upload.wikimedia.org/wikipedia/en/8/88/Dallas_Stars_logo.svg'
    'DET' = 'https://upload.wikimedia.org/wikipedia/en/e/e0/Detroit_Red_Wings_logo.svg'
    'EDM' = 'https://upload.wikimedia.org/wikipedia/en/4/4d/Edmonton_Oilers_logo.svg'
    'FLA' = 'https://upload.wikimedia.org/wikipedia/en/8/8a/Florida_Panthers_logo.svg'
    'LAK' = 'https://upload.wikimedia.org/wikipedia/en/8/8a/Los_Angeles_Kings_logo.svg'
    'MIN' = 'https://upload.wikimedia.org/wikipedia/en/8/8a/Minnesota_Wild_logo.svg'
    'MTL' = 'https://upload.wikimedia.org/wikipedia/en/6/6f/Logo_Montreal_Canadiens.svg'
    'NSH' = 'https://upload.wikimedia.org/wikipedia/en/9/9f/Nashville_Predators_logo.svg'
    'NJD' = 'https://upload.wikimedia.org/wikipedia/en/7/7a/New_Jersey_Devils_logo.svg'
    'NYI' = 'https://upload.wikimedia.org/wikipedia/en/8/85/New_York_Islanders_logo.svg'
    'NYR' = 'https://upload.wikimedia.org/wikipedia/en/4/4d/New_York_Rangers_logo.svg'
    'OTT' = 'https://upload.wikimedia.org/wikipedia/en/9/96/Ottawa_Senators_logo.svg'
    'PHI' = 'https://upload.wikimedia.org/wikipedia/en/e/e8/Philadelphia_Flyers_logo.svg'
    'PIT' = 'https://upload.wikimedia.org/wikipedia/en/e/e0/Pittsburgh_Penguins_logo.svg'
    'SJS' = 'https://upload.wikimedia.org/wikipedia/en/3/37/San_Jose_Sharks_logo.svg'
    'SEA' = 'https://upload.wikimedia.org/wikipedia/en/1/1a/Seattle_Kraken_logo.svg'
    'STL' = 'https://upload.wikimedia.org/wikipedia/en/e/e0/St._Louis_Blues_logo.svg'
    'TBL' = 'https://upload.wikimedia.org/wikipedia/en/2/2f/Tampa_Bay_Lightning_logo.svg'
    'TOR' = 'https://upload.wikimedia.org/wikipedia/en/b/b6/Toronto_Maple_Leafs_2016_logo.svg'
    'UTA' = 'https://upload.wikimedia.org/wikipedia/en/8/8a/Utah_Mammoth_logo.svg'
    'VAN' = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Vancouver_Canucks_logo.svg'
    'VGK' = 'https://upload.wikimedia.org/wikipedia/en/a/ac/Vegas_Golden_Knights_logo.svg'
    'WPG' = 'https://upload.wikimedia.org/wikipedia/en/d/d0/Winnipeg_Jets_logo.svg'
    'WSH' = 'https://upload.wikimedia.org/wikipedia/en/e/e8/Washington_Capitals_logo.svg'
}

# Create team_logos directory if it doesn't exist
if (!(Test-Path "team_logos")) {
    New-Item -ItemType Directory -Name "team_logos"
}

# Download each logo
foreach ($team in $teamLogos.Keys) {
    $url = $teamLogos[$team]
    $outputFile = "team_logos\$team.svg"
    
    Write-Host "Downloading $team logo..."
    try {
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
        $webClient.DownloadFile($url, $outputFile)
        Write-Host "Successfully downloaded $team logo"
    }
    catch {
        Write-Host "Failed to download $team logo: $($_.Exception.Message)"
    }
    finally {
        if ($webClient) {
            $webClient.Dispose()
        }
    }
}

Write-Host "Logo download complete!" 