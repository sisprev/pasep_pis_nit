# Sisprev::PasepPisNit

Validador de PASEP/PIS/NIT

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sisprev-pasep_pis_nit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sisprev-pasep_pis_nit

## Usage

    require 'sisprev/pasep_pis_nit'
    
    Sisprev::PasepPisNit.new(numero_pasep_pis_nit).valido?

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sisprev-pasep_pis_nit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
