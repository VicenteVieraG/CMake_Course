Param(
    [Parameter()]
    [switch]$run 
);
[string]$ExeName;

Remove-Item -Path build -Force -Recurse;
New-Item -Path .\ -Name build -ItemType Directory -Force;
Set-Location -Path .\build -ErrorAction Stop;
Invoke-Expression -Command "cmake ..";
Invoke-Expression -Command "cmake --build .";

if($run){
    Set-Location -Path .\app\Debug -ErrorAction Stop;
    $ExeName = Invoke-Expression "dir *.exe" | Select-Object -ExpandProperty Name -ErrorAction Stop;
    Write-Host -Object "-[Executing: $ExeName]" -BackgroundColor Blue -ForegroundColor Black;
    Invoke-Expression -Command ".\$ExeName";
    Set-Location -Path ..\..\..\;
}else{
    Set-Location -Path ..\ -ErrorAction Ignore;
}
