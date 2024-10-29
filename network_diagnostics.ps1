$servers = @("8.8.8.8", "1.1.1.1", "google.com")

foreach ($server in $servers) {
    if ($IsLinux) {
        # Using `ping` for Linux systems with error handling for name resolution
        $result = ping -c 1 $server 2>&1
        if ($result -match "Name or service not known" -or $result -match "100% packet loss") {
            Write-Output "$server is not reachable."
        } else {
            Write-Output "$server is reachable."
        }
    } else {
        # Use Test-NetConnection on Windows systems
        $result = Test-NetConnection -ComputerName $server
        if ($result.PingSucceeded) {
            Write-Output "$server is reachable."
        } else {
            Write-Output "$server is not reachable."
        }
    }
}
