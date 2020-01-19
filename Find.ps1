#variaveis
$caminho_arquivos = "/Users/alexandre/Developer"

#palavra a ser procurado dentro de cada arqiuvo retornado pelo comando Get-ChildItem
#$chave = "post"
#comandos
#git v1
foreach ($resultado in 
    (Get-ChildItem -Path $caminho_arquivos -Filter "*.csproj" -Recurse)) {

    $fullProjectPath = $resultado.FullName;

    $projXml = [xml](Get-Content -Path $fullProjectPath) 
    Write-Output "------------[$resultado]--------------"    
    foreach ($pref in $projXml.SelectNodes("//ItemGroup//ProjectReference")) {
        $proj_ref= [string]$pref.GetAttribute("Include");
        Write-Output $proj_ref
    } 

    foreach ($cref in $projXml.SelectNodes("//ItemGroup//PackageReference")) {
        $comp_ref= [string]$cref.GetAttribute("Include");
        Write-Output $comp_ref
    } 

} 
