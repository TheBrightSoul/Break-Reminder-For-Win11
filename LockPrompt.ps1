Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

# Read messages from file
$messagesFile = Join-Path $PSScriptRoot "messages.txt"
$messages = Get-Content $messagesFile

# Select a random message
$randomMessage = $messages | Get-Random

# XAML for the window
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Break Reminder" Height="200" Width="400" WindowStartupLocation="CenterScreen">
    <Grid Margin="10">
        <Grid.RowDefinitions>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <TextBlock x:Name="MessageText" Grid.Row="0" TextWrapping="Wrap" FontSize="16" VerticalAlignment="Center" HorizontalAlignment="Center"/>

        <StackPanel Grid.Row="1" Orientation="Horizontal" HorizontalAlignment="Center">
            <Button x:Name="TakeBreakButton" Content="Take a Break" Width="100" Margin="5"/>
            <Button x:Name="SkipButton" Content="Skip" Width="100" Margin="5"/>
        </StackPanel>
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Get controls
$messageText = $window.FindName("MessageText")
$takeBreakButton = $window.FindName("TakeBreakButton")
$skipButton = $window.FindName("SkipButton")

# Set the message
$messageText.Text = $randomMessage

# Button click events
$takeBreakButton.Add_Click({
    $window.DialogResult = $true
    $window.Close()
})

$skipButton.Add_Click({
    $window.DialogResult = $false
    $window.Close()
})

# Show the window
$result = $window.ShowDialog()

# Return the result
if ($result) {
    exit 1  # Take a break
} else {
    exit 0  # Skip
}