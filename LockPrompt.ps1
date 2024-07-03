# Read messages from file
$messagesFile = Join-Path $PSScriptRoot "messages.txt"
$messages = Get-Content $messagesFile

# Select a random message
$randomMessage = $messages | Get-Random

Add-Type -AssemblyName PresentationFramework

$buttonType = [System.Windows.MessageBoxButton]::YesNo
$messageBoxResult = [System.Windows.MessageBox]::Show($randomMessage, "Break Reminder", $buttonType)

if ($messageBoxResult -eq [System.Windows.MessageBoxResult]::Yes) {
    exit 1  # Yes
} else {
    exit 0  # No
}