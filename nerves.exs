use Mix.Config

version =
  Path.join(__DIR__, "VERSION")
  |> File.read!
  |> String.strip

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
    "linux-4.4",
    "package",
    "rootfs-additions",
    "busybox.config"
    "Config.in",
    "external.mk",
    "fwup.conf",
    "linux-backports.defconfig",
    "nerves_defconfig",
    "nerves.exs",
    "post-createfs.sh",
    "VERSION"
  ]
