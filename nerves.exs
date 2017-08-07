use Mix.Config

version =
  Path.join(__DIR__, "VERSION")
  |> File.read!
  |> String.trim

pkg = :nerves_system_linkit

config pkg, :nerves_env,
  type: :system,
  version: version,
  compiler: :nerves_package,
  artifact_url: [
    "https://github.com/nerves-project/#{pkg}/releases/download/v#{version}/#{pkg}-v#{version}.tar.gz",
  ],
  platform: Nerves.System.BR,
  platform_config: [
    defconfig: "nerves_defconfig",
  ],
  checksum: [
    "Config.in",
    "external.mk",
    "package",
    "rootfs-additions",
    "fwup.conf",
    "nerves_defconfig",
    "nerves.exs",
    "post-createfs.sh",
    "fwup.conf",
    "linux-4.4",
    "busybox.config",
    "linux-backports.defconfig",
    "VERSION"
  ]
