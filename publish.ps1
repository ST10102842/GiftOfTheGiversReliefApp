param(
  [string]$FunctionAppName = "<YOUR_FUNCTIONAPP_NAME>",
  [string]$ResourceGroup = "<YOUR_RESOURCE_GROUP>"
)

# Example publish script (edit values before running)
# Restores and publishes the Functions project, then uses az to deploy

dotnet restore
dotnet publish -c Release -o .\publish

# If Azure CLI is available and user has configured it
if (Get-Command az -ErrorAction SilentlyContinue) {
  if ($FunctionAppName -eq "<YOUR_FUNCTIONAPP_NAME>") {
    Write-Host "Edit publish.ps1 and set FunctionAppName before running."
  } else {
    az functionapp deploy --name $FunctionAppName --resource-group $ResourceGroup --src-path .\publish
  }
} else {
  Write-Host "Azure CLI not found; published output is in .\publish. Use your preferred deploy method."
}
