# Release checklist

  1. Update CHANGELOG.md with a bulletpoint list of new features and bug fixes.
  2. Remove the `-dev` from the version numbers in `CHANGELOG.md` and `VERSION`. If
     doing an `rc` release, mark them appropriately.
  3. For a non-rc releases, update the version numbers in `README.md`. They
     won't work until ci.nerves-project.org completes and uploads the systems, but "that's ok".
  4. Check that the dependencies in the `mix.exs` point to real releases. Mainly
     check that the `nerves_system_br` dep is correct.
  5. Run `mix deps.get` to make sure any updates are reflected in the `mix.lock`
     file.
  6. Commit changes (this is still in the `develop` branch)
  7. `git checkout master` and `git pull` just in case `master` isn't up to
     date.
  8. `git merge --ff-only develop`
  9. `git tag -a v<version number>`
  10. Push latest commit(s) from master *and* the tag to GitHub
  11. Wait for ci.nerves-project.org to finish building release
  12. Copy the latest CHANGELOG.md entry to the GitHub releases description.
      Make sure that the system artifacts are there. If everything is ok,
      publish the release.
  13. Run `mix hex.publish package`
  14. Update and build `blinky` to verify that the new system downloads and
      builds properly.
  15. `git checkout develop` (If any changes were made to `master`, fast forward
      develop to the tip of `master`)
  16. Start the next dev cycle. Start a new section in `CHANGELOG.md` and
      update the version in `VERSION` to a `-dev` version.
  17. Commit version updates to the `develop` branch
  18. Push changes up to GitHub

