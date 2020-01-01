$auth_obj = @{
    userId = "Alexandre"
    password = "234xT"
}

$auth_obj_json = $auth_obj | ConvertTo-Json

Write-Host $auth_obj_json