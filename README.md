# FieldTrip Bugzilla

Starting from about 2009, we have used a locally hosted Bugzilla instance as
our “issue tracker” to maintain and distribute to-do lists and supports the
follow-up communication between developers and users. Since about 2016 we
moved on to GitHub for project management and issue tracking. Although we
have kept the bugzilla server online up to 2024, keeping it further online
was not possible due to resource limitations and security concerns.

The bugs from our original bugzilla server have been archived here in the
form of a static Jekyll website.

This website is meant to be compiled into HTML using Jekyll, and served on
an Apache http server with redirections enabled. The `.htaccess` redirects
from the URLs of the original bugzilla server to the corresponding static
pages.

# Making a static copy of bugzilla

First I downloaded all bugs in xml format.

    for i in {1..3476} ; do wget "http://bugzilla.fieldtriptoolbox.org/show_bug.cgi?ctype=xml&id=$i" -O ~/Desktop/bugzilla/xml/$i.xml ; done

As Jekyll cannot deal with data in xml files but can deal with ymland with json files,
I converted the xml files into yml using <https://mikefarah.gitbook.io/yq>.

    for i in {1..3476} ; do yq -o yaml ~/Desktop/bugzilla/xml/$i.xml > $i.yml ; done

Some of the bug reports contain file attachments in base64 encoding, which makes the
yml files very large. As I don't want to have large files in my git repository, I
wrote a bash script (again using yp) to copy the base64-encoded attachments to
separate yml files, and to remove the attachment data field from each of the bugs.

This results in files like this

    xxx.xml               # for the original bug in xml format
    xxx.yml               # for the original bug in yml format, no attachment data
    xxx-attachment1.yml   # the yml for the 1st attachment
    xxx-attachment2.yml   # the yml for the 2st attachment

Only the files `xxx.yml` should be committed to the git repository. The attachments
need to be decoded and stored somewhere else, for example directly on the Apache http
server, or on a webdav server.

# Bulding the static website

The following command makes the html files and serves them locally.

  bundle exec jekyll serve --incremental --livereload
