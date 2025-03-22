Integrity File Manager:
  A PowerShell-based file integrity monitoring solution that detects and reports changes to your file system baseline.

Overview:
  Integrity File Manager implements the Integrity component of the CIA (Confidentiality, Integrity, Availability) triad in cybersecurity. It establishes a baseline of your file system and alerts you when files are created, modified, or deleted, helping you maintain the integrity of your data.

Features:
  Baseline Creation: Captures file metadata including hashes, sizes, and timestamps
  Integrity Monitoring: Detects file modifications, deletions, and new file creation
  Comprehensive Reporting: Provides detailed reports of changes between scans
  Configurable Scope: Customize which directories and file types to monitor
  Alerting Options: Email notifications, log files, and console output
  Scheduling Support: Run as a scheduled task for continuous monitoring

Prerequisites:
  PowerShell 5.1 or higher
  Administrator privileges for initial setup
  .NET Framework 4.5 or higher
