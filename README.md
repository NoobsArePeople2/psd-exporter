# PSD Exporter

A command line script for exporting PSD layers as PNGs.

## Installation

A simple

    $ gem install psd

should be sufficient to install all the dependencies for PSD Exporter. PSD Exporter depends on [PSD.rb](https://github.com/layervault/psd.rb).

## Usage

The simplest use case is to just provide a PSD to export:

    $ export_psd.rb my-psd.psd

All of the layers will be exported to a folder called `output` in the same folder as `my-psd.psd`.

If you want to drop them in a folder other than one called `output`, provide another option:

    $ export_psd.rb my-psd.psd myfolder

Now all of the layers will be dropped into a folder named `myfolder`.

So far all our images are the exact dimensions of the original PSD. This isn't always ideal -- sometimes you want the PNGs to be trimmed. To do that just specify the `trim` option:

    $ export_psd.rb my-psd.psd trimmed-output trim

After running this you'll have a bunch of trimmed PNGs in a folder called `trimmed-output`.

## License

PSD Exporter is licensed under the MIT license.
