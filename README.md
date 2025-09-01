# Avalanche Ruby SDK

[Avalanche](https://www.avax.network/) is a decentralized, open-source Layer-1 blockchain platform developed.

This Ruby SDK provides a convenient way to interact with the Avalanche APIs.

[AvaCloud](https://www.avacloud.io/) is a powerful and flexible toolset designed to simplify the integration with AvaCloud's suite of blockchain services.


## Documentation

For detailed API documentation, please visit: [Avalanche API Documentation](https://developers.avacloud.io/introduction)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avalanche'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install avalanche
```

## Configuration

Add the following configuration to `config/initializers/avalanche.rb`:

```ruby
Avalanche::AvaCloud.configure do |config|
  config.api_key = "avacloud_api_key" 
  config.network = "testnet"
  config.chain_id = 1
end
```

## Usage

### Avalanche AvaCloud Data API

```ruby
chains = Avalanche::AvaCloud::Data::EVM::Chains.chains
```

```json
{
  "chains": [
    {
      "chainId": "<string>",
      "status": "OK",
      "chainName": "<string>",
      "description": "<string>",
      "platformChainId": "<string>",
      "subnetId": "<string>",
      "vmId": "<string>",
      "vmName": "EVM",
      "explorerUrl": "<string>",
      "rpcUrl": "<string>",
      "wsUrl": "<string>",
      "isTestnet": true,
      "utilityAddresses": {
        "multicall": "<string>"
      },
      "networkToken": {
        "name": "Wrapped AVAX",
        "symbol": "WAVAX",
        "decimals": 18,
        "logoUri": "https://images.ctfassets.net/gcj8jwzm6086/5VHupNKwnDYJvqMENeV7iJ/fdd6326b7a82c8388e4ee9d4be7062d4/avalanche-avax-logo.svg",
        "description": "<string>"
      },
      "chainLogoUri": "<string>",
      "private": true,
      "enabledFeatures": [
        "nftIndexing"
      ]
    }
  ]
}
```

### Avalanche AvaCloud Metrics API

```ruby
metrics = Avalanche::AvaCloud::Metrics::Chains.chains
```

```json
{
  "chains": [
    {
      "evmChainId": 43114,
      "chainName": "c_chain",
      "blockchainId": "2q9e4r6Mu3U68nU1fYjgbR6JvwrRx36CohpAX5UQxse55x1Q5",
      "subnetId": "11111111111111111111111111111111LpoYY",
      "network": "mainnet"
    }
  ]
}
```

### Avalanche AvaCloud Webhook API

```ruby
webhooks = Avalanche::AvaCloud::Webhooks::Webhook.lists
```

```json
{
  "webhooks": [
    {
      "id": "<string>",
      "url": "<string>",
      "chainId": "<string>",
      "status": "active",
      "createdAt": 123,
      "name": "<string>",
      "description": "<string>",
      "eventType": "address_activity",
      "metadata": {
        "eventSignatures": [
          "0x61cbb2a3dee0b6064c2e681aadd61677fb4ef319f0b547508d495626f5a62f64"
        ],
        "addresses": [
          "0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E"
        ]
      },
      "includeInternalTxs": true,
      "includeLogs": true
    }
  ]
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/avalanche. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/avalanche/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Avalanche project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/avalanche/blob/master/CODE_OF_CONDUCT.md).
