const String sVar = 'COINBASE_CLIENT_ID';

/// Environment variables.
/// Needs to be const to be handled by console params when building
class Env {
  const Env({
    required this.baseUrl,
    required this.apiKey,
    required this.secretKey,
    required this.isDebug,
  });
  final String baseUrl;
  final String apiKey;
  final String secretKey;
  final bool isDebug;
}

enum EnvTypes { dev, prd, qa }

const Map<EnvTypes, Env> envs = <EnvTypes, Env>{
  EnvTypes.dev: Env(
    baseUrl: 'https://api-dev.tokenpad.io',
    apiKey: 'b9bb9d9d-ad06-4ca5-9065-f6da2aefae5d',
    secretKey: '547f8e64-aea5-4410-975d-2d91ef28fd71',
    isDebug: true,
  ),
  EnvTypes.qa: Env(
    baseUrl: 'https://api-qa.tokenpad.io',
    apiKey: 'b9bb9d9d-ad06-4ca5-9065-f6da2aefae5d',
    secretKey: '547f8e64-aea5-4410-975d-2d91ef28fd71',
    isDebug: true,
  ),
  EnvTypes.prd: Env(
    baseUrl: 'https://api.tokenpad.io',
    apiKey: String.fromEnvironment('TOKENPAD_API_KEY'),
    secretKey: String.fromEnvironment('TOKENPAD_SECRET_KEY'),
    isDebug: false,
  ),
};
