# Adds a simple rule to the Windows firewall that blocks access to all 192.168.*.*/24, 
# except 192.168.1.1 supposed to be the gateway. Expected net mask is /24.
# Runs once, as admin.

$RuleSplat = @{
		Name = "{6B6DB3C0-DE26-4C11-9AE0-A831C74E75A9}"
		Displayname = "MYRULE: No local network but gateway"
		Description = "Blocks access to all 192.168.*.*/24, except 192.168.1.1 supposed to be the gateway. Expected mask is /24."
		Enabled = "True"
		Profile = "Any"
		Direction = "Outbound"
		Action = "Block"
		EdgeTraversalPolicy = "Block"
		LooseSourceMapping = $False
		LocalOnlyMapping = $False
		LocalAddress = "Any"
		RemoteAddress = @("192.168.1.2-192.168.1.255", "192.168.1.0")
		Protocol = "Any"
		LocalPort = "Any"
		RemotePort = "Any"
		IcmpType = "Any"
		DynamicTarget = "Any"
		Program = "Any"
		Service = "Any"
		InterfaceAlias ="Any"
		InterfaceType = "Any"
		LocalUser = "Any"
		RemoteUser = "Any"
		RemoteMachine = "Any"
		Authentication = "NotRequired"
		Encryption = "NotRequired"
		OverrideBlockRules = $False
	}


Get-NetFirewallRule -EA SilentlyContinue -Name $RuleSplat.Name | Remove-NetFirewallRule
New-NetFirewallRule -EA Continue @RuleSplat
