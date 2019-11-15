
foreach ($c in (1..8)){
    New-Object -TypeName psobject -Property @{
        PlaceCount=$c;
        MaxValueInBinary=[math]::pow(2,$c);
        MaxValueInOctal=[math]::pow(8,$c);
        MaxValueInHex=[math]::pow(16,$c);
    }
}