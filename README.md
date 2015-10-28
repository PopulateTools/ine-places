# INE Places gem

[![Build Status](https://travis-ci.org/PopulateTools/ine-places.svg)](https://travis-ci.org/PopulateTools/ine-places)
[![Gem Version](https://badge.fury.io/rb/ine-places.svg)](https://badge.fury.io/rb/ine-places)

INE Places gem aims to help you to deal with Autonomous Regions, Provinces and Municipalities from
Spain. This data is provided by the INE (Instituto Nacional Estadística) in these URLs:

http://www.ine.es/daco/daco42/codmun/codmun11/11codmunmapa.htm
http://www.ine.es/jaxi/menu.do?type=pcaxis&path=/t20/e245/codmun&file=inebase&L=0

According to that webpage the data **was updated the 3rd of February, 2015**. As you might know municipalities
data changes along the years: sometimes two municipalities are merged in a single one [more
information in Spanish](http://www.ine.es/daco/daco42/codmun/codmunmod.htm). For this
reason it's important to know the date of the data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ine-places', require: 'ine/places/places'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ine-places

## Usage

This gem provides three models:

- `INE::Places::AutonomousRegion`

- `INE::Places::Province`

- `INE::Places::Place`

The data of these models is loaded from three CSV files included as part of the gem. Because the
size of the data is quite small, this gem will load all the data in memory.

### INE::Places::AutonomousRegion

This model represents the [autonomous regions in Spain](https://en.wikipedia.org/wiki/Autonomous_communities_of_Spain).

The attributes of this model are:

- id: INE code
- name: the official name in the INE
- slug: a sanitized name, valid for URLs
- lon: longitude of the central point
- lat: latitude of the central point

To obtain all the autonomous regions:

```ruby
INE::Places::AutonomousRegion.all
```

To obtain a single one based on the INE code:

```ruby
INE::Places::AutonomousRegion.find('1')
=> #<INE::Places::AutonomousRegion id="1", name="Andalucía", slug="andalucia", lon="-4.7277528", lat="37.5442706">
```

To obtain a single one based on the name:

```ruby
INE::Places::AutonomousRegion.find_by_name('Andalucía')
=> #<INE::Places::AutonomousRegion id="1", name="Andalucía", slug="andalucia", lon="-4.7277528", lat="37.5442706">
```

To obtain a single one based on the slug:

```ruby
INE::Places::AutonomousRegion.find_by_slug('andalucia')
=> #<INE::Places::AutonomousRegion id="1", name="Andalucía", slug="andalucia", lon="-4.7277528", lat="37.5442706">
```

### INE::Places::Province

This model represents the [provinces in Spain](https://en.wikipedia.org/wiki/Provinces_of_Spain)

The attributes of this model are:

- id: INE code
- name: the official name in the INE
- slug: a sanitized name, valid for URLs
- autonomous_region_id: the INE code of the autonomous region
- autonomous_region: the AutonomousRegion object
- lon: longitude of the central point
- lat: latitude of the central point

To obtain all the provinces:

```ruby
INE::Places::Province.all
```

To obtain a single one based on the INE code:

```ruby
INE::Places::Province.find('1')
=> #<INE::Places::Province id="1", name="Araba/Álava", slug="alava", autonomous_region_id="16", lon="-2.6983868", lat="42.9099989", autonomous_region=#<INE::Places::AutonomousRegion id="16", name="País Vasco", slug="pais-vasco", lon="-2.6189273", lat="42.9896248">>
```

To obtain a single one based on the name:

```ruby
INE::Places::Province.find_by_name('Araba/Álava')
=> #<INE::Places::Province id="1", name="Araba/Álava", slug="alava", autonomous_region_id="16", lon="-2.6983868", lat="42.9099989", autonomous_region=#<INE::Places::AutonomousRegion id="16", name="País Vasco", slug="pais-vasco", lon="-2.6189273", lat="42.9896248">>
```

To obtain a single one based on the slug:

```ruby
INE::Places::Province.find_by_slug('alava')
=> #<INE::Places::Province id="1", name="Araba/Álava", slug="alava", autonomous_region_id="16", lon="-2.6983868", lat="42.9099989", autonomous_region=#<INE::Places::AutonomousRegion id="16", name="País Vasco", slug="pais-vasco", lon="-2.6189273", lat="42.9896248">>
```

### INE::Places::Place

This model represents the [municipalities in Spain](https://en.wikipedia.org/wiki/List_of_municipalities_of_Spain)

The attributes of this model are:

- id: INE code
- name: the official name in the INE
- slug: a sanitized name, valid for URLs
- province_id: the INE code of the province
- province: the Province object
- lon: longitude of the central point
- lat: latitude of the central point

To obtain all the places:

```ruby
INE::Places::Place.all
```

To obtain a single one based on the INE code:

```ruby
INE::Places::Place.find('46078')
=> #<INE::Places::Place id="46078", name="Burjassot", slug="burjassot", province_id="46", lon="-0.4135963", lat="39.5096699", province=#<INE::Places::Province id="46", name="Valencia/València", slug="valencia", autonomous_region_id="10", lon="-0.3762881", lat="39.4699075", autonomous_region=#<INE::Places::AutonomousRegion id="10", name="Comunidad Valenciana", slug="comunidad-valenciana", lon="-0.7532808999999999", lat="39.4840108">>>
```

To obtain a single one based on the name:

```ruby
INE::Places::Place.find_by_name('Burjassot')
=> #<INE::Places::Place id="46078", name="Burjassot", slug="burjassot", province_id="46", lon="-0.4135963", lat="39.5096699", province=#<INE::Places::Province id="46", name="Valencia/València", slug="valencia", autonomous_region_id="10", lon="-0.3762881", lat="39.4699075", autonomous_region=#<INE::Places::AutonomousRegion id="10", name="Comunidad Valenciana", slug="comunidad-valenciana", lon="-0.7532808999999999", lat="39.4840108">>>
```

To obtain a single one based on the slug:

```ruby
INE::Places::Place.find_by_slug('burjassot')
=> #<INE::Places::Place id="46078", name="Burjassot", slug="burjassot", province_id="46", lon="-0.4135963", lat="39.5096699", province=#<INE::Places::Province id="46", name="Valencia/València", slug="valencia", autonomous_region_id="10", lon="-0.3762881", lat="39.4699075", autonomous_region=#<INE::Places::AutonomousRegion id="10", name="Comunidad Valenciana", slug="comunidad-valenciana", lon="-0.7532808999999999", lat="39.4840108">>>
```

## Development

After checking out the repository, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PopulateTools/ine-places. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) [code of conduct](CODE_OF_CONDUCT.md).

## Data License

The data included in this gem has been extracted from the [INE](http://ine.es) and has been
processed and manipulated to fit in a CSV format. The sources of the data are included in the first
paragraph of this file.

Please read the conditions about using the data provided by this gem in the [INE documentation](http://www.ine.es/ss/Satellite?L=0&c=Page&cid=1254735849170&p=1254735849170&pagename=Ayuda%2FINELayout#).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

