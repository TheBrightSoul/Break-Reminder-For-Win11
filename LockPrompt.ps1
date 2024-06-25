param (
    [string]$message = "Soul! You need a Break! Turn off the System!"
)

Add-Type -AssemblyName PresentationFramework

$buttonType = [System.Windows.MessageBoxButton]::YesNo
$messageBoxResult = [System.Windows.MessageBox]::Show($message, "Break Reminder", $buttonType)

if ($messageBoxResult -eq [System.Windows.MessageBoxResult]::Yes) {
    exit 1  # Yes
} else {
    exit 0  # No
}