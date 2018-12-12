# date-prefix
Prefix files with their associated creation date.

# Execution
$ cd path/to/dir/with/files/to/rename

$ ruby path/to/datePrefix.rb

# Example Usage
$ ls -la
total 70376
drwxr-xr-x    7 urielper  eng      224 Dec 12 09:56 .
drwx------+ 180 urielper  eng     5760 Dec 12 09:56 ..
-rw-r--r--@   1 urielper  eng  7453825 Dec 12 09:56 510A0335.jpg
-rw-r--r--@   1 urielper  eng  5484924 Dec 12 09:56 510A0720.jpg
-rw-r--r--@   1 urielper  eng  6329389 Dec 12 09:56 510A1493.jpg
-rw-r--r--@   1 urielper  eng  8032876 Dec 12 09:56 510A4362.jpg
-rw-r--r--@   1 urielper  eng  8719607 Dec 12 09:56 510A9279.jpg
$ ruby datePrefixrb
$ ls -la
total 70376
drwxr-xr-x    7 urielper  eng      224 Dec 12 10:00 .
drwx------+ 180 urielper  eng     5760 Dec 12 09:56 ..
-rw-r--r--@   1 urielper  eng  7453825 Dec 12 09:56 20181212_510A0335.jpg
-rw-r--r--@   1 urielper  eng  5484924 Dec 12 09:56 20181212_510A0720.jpg
-rw-r--r--@   1 urielper  eng  6329389 Dec 12 09:56 20181212_510A1493.jpg
-rw-r--r--@   1 urielper  eng  8032876 Dec 12 09:56 20181212_510A4362.jpg
-rw-r--r--@   1 urielper  eng  8719607 Dec 12 09:56 20181212_510A9279.jpg
