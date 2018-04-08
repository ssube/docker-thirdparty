# Dockerfiles for Third-Party Stuff

These are dockerfiles maintained for third-party tools, languages, and the `apextoaster/base` utility image.

To make pipelines and updates easy, these are in a monorepo. Make sure images build to the same hash (clean up caches).

## Cleanup

Clean up `apt-get` with `apt-get autoclean && apt-get clean && rm -rf /var/lib/apt/lists/*`.

## Paths

`/build` and `/secrets` are reserved mount points for CI jobs.
`/config` and `/data` are reserved mount points for runtime data.

Tools that need an install directory should use `/<tool>`.