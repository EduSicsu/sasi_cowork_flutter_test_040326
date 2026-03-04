# Login

## Responsibility

Handles user authentication via email and password. On success, navigates to the home screen. If the API returns `mfaType`, transitions to the MFA verification screen instead.

## Structure

- `login_page.dart` — LoginPage with `routeName '/login'`, static `build`, `navigate` and `replace` methods; listens to LoginState and handles navigation side-effects
- `cubit/login_cubit.dart` — calls `AuthService.login`; emits `LoginMfaRequired` when second factor is needed
- `cubit/login_state.dart` — sealed states: `LoginInitial`, `LoginLoading`, `LoginSuccess`, `LoginMfaRequired`, `LoginFailure`
- `cubit/cubit.dart` — barrel for cubit + state
- `login.dart` — barrel for page + cubit
- `widgets/login_form.dart` — form with email/password fields and submit button; reads `LoginCubit` from context

## Dependencies

- `AuthService` — performs the login API call and persists tokens

## Routes

- Route: `/login`
- Entry: `LoginPage.navigate(context)` or `LoginPage.replace(context)`
- Exits to: `/home` on success, `/mfa-verification` when MFA is required
