# docker-isync

This repository provides a Docker build environment for [isync](https://isync.sourceforge.net/), also known as `mbsync`. It allows you to easily build and run isync/mbsync in a containerized environment.

## What is isync/mbsync?

isync is a command line utility for synchronizing mailboxes. The main executable, `mbsync`, supports both Maildir and IMAP4 mailboxes. It can propagate new messages, deletions, and flag changes in both directions, making it suitable for use in IMAP-disconnected mode (such as on laptops or with intermittent internet connections).

Key features include:

- Synchronization based on unique message identifiers (UIDs), preventing identification conflicts.
- Support for both Maildir and IMAP4 mailboxes.
- Safe concurrent operation and robust state management.
- Fine-grained selection of synchronization operations.

For more information, see the [official isync documentation](https://isync.sourceforge.net/).

## Usage

This repository contains a Dockerfile and related configuration to build a Docker image for isync/mbsync. You can use this image to run mailbox synchronization jobs in a containerized environment.

Typical usage:

```sh
docker build -t isync .
docker run --rm -v /path/to/config:/config -v /path/to/maildir:/maildir isync mbsync -c /config/isyncrc
```

Replace `/path/to/config` and `/path/to/maildir` with appropriate paths on your system.

## License

isync is licensed under the GPL v2. See the upstream project for details.
