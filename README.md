Integrity File Monitoring System:
  
  A PowerShell-based file integrity monitoring solution that detects and reports changes to your file system baseline.

Overview:
  
  Integrity File Manager implements the Integrity component of the CIA (Confidentiality, Integrity, Availability) triad in cybersecurity. It establishes a baseline of your file system and alerts you when files are created, modified, or deleted, helping you maintain the integrity of your data.

Features:
  
  Baseline Creation: Captures file hashes
  Integrity Monitoring: Detects file modifications, deletions, and new file creation
  Comprehensive Reporting: Provides reports of changes between scans
  Configurable Scope: Customize which directories and file types to monitor

Prerequisites:
  
  PowerShell 5.1 or higher
  Administrator privileges for initial setup
  .NET Framework 4.5 or higher

Example Use Cases:
  
  Server Monitoring: Detect unauthorized changes to critical system files
  Compliance: Track file changes for regulatory requirements
  Configuration Management: Verify system integrity after updates
  Security Monitoring: Detect potential malware activity

How It Works

Baseline Phase:

  Recursively scans directories
  Calculates SHA-512 hash for each file

Verification Phase:

  Performs new scan of target directories
  Compares against baseline data
  Identifies changes by hash comparison
  Generates change report

Practical Tips

  Store baseline files outside monitored directories
  Update baselines after legitimate changes
  Run frequent checks

Security Notes

  Protect your baseline files - they define your "trusted state"
  Consider using dedicated credentials for email alerts
  Run with least privilege necessary for the monitored paths
  Review reports regularly for unexpected changes
