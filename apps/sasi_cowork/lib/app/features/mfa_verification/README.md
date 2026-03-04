# MFA Verification

## Responsibility

Handles the second factor of authentication. Receives a `mfaType` (email, phone, or authenticator) via route arguments and prompts the user to enter the one-time code. On success, navigates to the home screen.

## Structure

- `mfa_verification_page.dart` — MfaVerificationPage with `routeName '/mfa-verification'`, static `build`, `navigate` and `replace` methods; reads `mfaType` from route arguments
- `cubit/mfa_verification_cubit.dart` — calls `AuthService.verifyMfa`
- `cubit/mfa_verification_state.dart` — sealed states: `MfaVerificationInitial`, `MfaVerificationVerifying`, `MfaVerificationSuccess`, `MfaVerificationFailure`
- `cubit/cubit.dart` — barrel for cubit + state
- `mfa_verification.dart` — barrel for page + cubit
- `widgets/mfa_code_input.dart` — numeric code input (up to 6 digits) with submit button

## Dependencies

- `AuthService` — performs the MFA verification API call

## Routes

- Route: `/mfa-verification`
- Arguments: `{ 'tempAccessToken': String, 'mfaType': String }`
- Entry: `MfaVerificationPage.replace(context, tempAccessToken: ..., mfaType: ...)`
- Exits to: `/home` on success
