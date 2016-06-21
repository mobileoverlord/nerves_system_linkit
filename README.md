# LinkIt Smart

[![Build Status](https://travis-ci.org/nerves-project/nerves_system_linkit.png?branch=master)](https://travis-ci.org/nerves-project/nerves_system_linkit)

This is the base Nerves System configuration for the [LinkIt Smart](http://www.seeedstudio.com/wiki/LinkIt_Smart_7688_Duo).

![LinkIt Smart Duo image](assets/images/linkit-smart.jpg)

| Feature              | Description                     |
| -------------------- | ------------------------------- |
| CPU                  | 580 MHz MIPS24KEc               |
| Memory               | 128 MB DRAM                     |
| Storage              | 32 MB NAND Flash and MicroSD    |
| Linux kernel         | 3.18.29 w/ patches              |
| IEx terminal         | ttyS2 via FTDI pins             |
| GPIO, I2C, SPI       | Yes - Elixir ALE                |
| ADC                  | Yes, on Duo's ATmega32U4        |
| PWM                  | Yes, on Duo's ATmega32U4        |
| UART                 | 3?                              |
| Camera               | None                            |
| Ethernet             | Yes, via expansion board        |
| WiFi                 | Yes                             |

## Console access

The console is configured to output to `ttyS2` by default. This is the
UART output accessible via pins 8 and 9. A 3.3V FTDI
cable is needed to access the output.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add nerves_system_linkit to your list of dependencies in `mix.exs`:

        def deps do
          [{:nerves_system_linkit, "~> 0.4.0"}]
        end

  2. Ensure nerves_system_linkit is started before your application:

        def application do
          [applications: [:nerves_system_linkit]]
        end


