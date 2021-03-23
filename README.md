![Jera Logo](https://jera.com.br/images/logo-jera-dark.svg)

JeraPayment helps you use Iugu, MercadoPago and Pagar.me API's in a simple and fast way.
It helps you integrate those API's into your application using a layer of abstraction for it's core objects.

It's composed of:

  * [Customer](#customers): model responsible for registering api customers.
  * [CreditCard](#credit_cards): model responsible for registering customer's payment methods.
  * [Invoice](#invoices): model responsible for registering api invoices.
  * [Charge](#charges): model responsible for invoice's payment charge.
  * [Plan](#plans): model responsible for registering account's plans.
  * [Subscription](#subscriptions): model responsible for registering plan's subscriptions.
  * [SubAccount](#sub_accounts): model responsible for registering marketplace's accounts.
  * [Household](#households): model responsible for households.
  * [Withdrawal](#withdrawals): model responsible for registering sub account withdrawals.
  * [Transfer](#transfers): model responsible for registering sub account transfers.


## Getting started

Add this line to your application's Gemfile:

```ruby
gem 'jera_payment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jera_payment

Next, run the installer. You can do it with this command:
~~~bash
$ rails generate jera_payment:install
~~~

That command will create the necessary migrations and the initialization file. It will be like this:
```ruby
#this is the intilizer
#here you will set up jera payments configuration
JeraPayment.setup do |config|
  config.api = 'YOUR_API' # :pagar_me, :iugu, :mercado_pago
  config.api_key = 'YOUR_PRODUCTION_API_KEY' # string
  config.api_key_test = 'YOUR_DEVELOPMENT_API_KEY' # string
  config.account_id = 'YOUR_API_ACCOUNT_ID' # string
  config.is_test = 'TRUE_OF_FALSE' # boolean
end
```

Then, run the generator and pass the model to associate with a customer/marketplace. You can do it like this:
~~~bash
$ rails generate jera_payment MODEL_NAME Customer SubAccount
~~~

At last, add this lines to your application.rb file so your project can reach the handlecallbacks services that we inject:

``` ruby
config.autoload_paths += %W(#{config.root}/app)
config.eager_load_paths += %W(#{config.root}/app)

config.autoload_paths += %W(#{config.root}/lib/**/)
config.autoload_paths += Dir["#{config.root}/lib/**/"]
```

## Customer

> Model responsible for registering api customers.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| customerable_id | BigInt | Your model's ID that has_one JeraPayment::Customer |
| customerable_type | String | Your model's name that has_one JeraPayment::Customer |
| api_id | String | Customer's API ID |
| email | String | Customer email |
| name | String | Customer name |
| phone | String | Customer phone |
| cpf_cpnj | String | Customer CPF/CNPJ |
| current_credit_card_id | BigInt | Your project's Credit Card Id |

## CreditCard

> Model responsible for registering customer's payment methods.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| customer_id | BigInt | Your project's Customer Id  |
| api_id | String | The payment method API's ID |
| brand | String | Credit Card's Brand |
| number | String | Credit Card's Number |
| first_name | String | Credit Card's First Name |
| last_name | String | Credit Card's Last Name |
| cvv | String | Credit Card's CVV |
| month | String | Credit Card's month expiration |
| year | String | Credit Card's year expiration |
| description | String | Credit Card's description |
| test | Boolean | Credit Card is test? |
| set_as_default | String | Boolean but need to send as string |

## Invoice

> Model responsible for registering the api invoices.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| customer_id | BigInt | Your project's Customer Id |
| api_id | String | Invoice's API ID |
| status | Enumerize | Invoice Status (pending, paid, canceled, partially_paid, refunded, expired, authorized, in_protest, chargeback, in_analysis) |
| email | String | Customer e-mail |
| cc_emails | String | -- |
| due_date | String | -- |
| cc_emails | String | -- |
| ensure_workday_due_date | Boolean | -- |
| items | Text (send as hash) | -- |
| commissions | Text (send as hash) | -- |
| total_cents | Int | -- |
| discount_cents | Int | -- |
| payable_with | String | -- |
| return_url | String | -- |
| expired_url | String | -- |
| notification_url | String | -- |
| fines | Noolean | -- |
| late_payment_fine | String | -- |
| per_day_interest | Boolean | -- |
| ignore_due_email | Boolean | -- |
| ignore_canceled_email | Boolean | -- |
| current_fines_option | Boolean | -- |
| keep_early_payment_discount | Boolean | -- |
| subscription_api_id | String | -- |
| credits | Int | -- |
| early_payment_discount | Boolean | -- |
| early_payment_discounts | Text (send as hash) | -- |
| cpf_cnpj | String | -- |
| name | String | -- |
| phone_prefix | String | -- |
| phone | String | -- |
| email | String | -- |
| zip_code | String | -- |
| street | String | -- |
| number | String | -- |
| neighborhood | String | -- |
| city | String | -- |
| state | String | -- |
| country | String | -- |
| complement | String | -- |
| paid_at | String | -- |
| secure_url | String | -- |
| digitable_line | String | -- |
| barcode_data | String | -- |
| barcode | String | -- |
| duplicated | Boolean | -- |

## Charge

> Model responsible for invoice's payment charge.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| invoice_id | BigInt | Your project's Invoice Id |
| method | String | -- |
| token | String | -- |
| customer_payment_method_api_id | String | Your API Credit Card Id |
| restrict_payment_method | Boolean | -- |
| customer_api_id | String | -- |
| email | String | -- |
| months | Int | -- |
| discount_cents | Int | -- |
| bank_slip_extra_days | Int | -- |
| keep_dunning | Boolean | -- |
| items | Text (send as hash) | -- |
| cpf_cnpj | String | -- |
| name | String | -- |
| phone_prefix | String | -- |
| phone | String | -- |
| email | String | -- |
| zip_code | String | -- |
| street | String | -- |
| number | String | -- |
| neighborhood | String | -- |
| city | String | -- |
| state | String | -- |
| country | String | -- |
| complement | String | -- |
| paid_at | String | -- |
| secure_url | String | -- |
| digitable_line | String | -- |
| barcode_data | String | -- |
| barcode | String | -- |
| duplicated | Boolean | -- |

## Plan

> Model responsible for registering account's plans.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| api_id | String | Plan's API ID |
| name | String | Plan's name |
| identifier | String | Plan's identifier |
| interval | Int | Number interval for payment |
| interval_type | String | Interval type |
| value_cents | String | Plan's price in cents |
| payable_with | String | Payment method disponible |
| features | Text (send as hash) | -- |

## Subscription

> Model responsible for registering subscription's plans.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| api_id | String | Subscription's API ID |
| customer_id | BigInt | Your project's Customer Id |
| plan_identifier | String | Plan's identifier |
| only_on_charge_success | Boolean | -- |
| ignore_due_email | Boolean | -- |
| payable_with | String | -- |
| credits_based | Boolean | -- |
| price_cents | Int | -- |
| credits_cycle | Int | -- |
| credits_min | Int | -- |
| subitems | Text (send as hash) | -- |
| custom_variables | Text (send as hash) | -- |
| suspended | Boolean | -- |
| active | Boolean | -- |
| skip_charge | Boolean | -- |
| credits | String | -- |

## SubAccount

> Model responsible for marketplace accounts.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| account_id | String | SubAccount's API ID |
| live_api_token | String | Token to production requests |
| test_api_token | String | Token to development requests |
| user_token | String | Token to some production requests |
| current_household_id | BigInt | ID from default household |
| sub_accountable_id | BigInt | Your model's ID that has_one JeraPayment::SubAccount |
| sub_accountable_type | String | Your model's name that has_one JeraPayment::SubAccount |
| name | String | -- |
| commissions | Text (send as hash) | -- |
| auto_withdrawal | Boolean | -- |
| fines | Boolean | -- |
| per_day_interest | Boolean | -- |
| late_payment_fine | Int | -- |
| auto_advance | Boolean | -- |
| auto_advance_type | String | -- |
| auto_advance_option | Int | -- |
| bank_slip | Text (send as hash) | -- |
| credit_card | Text (send as hash) | -- |
| payment_email_notification | Boolean | -- |
| payment_email_notification_receiver | String | -- |
| early_payment_discount | Boolean | -- |
| early_payment_discounts | Text (send as hash) | -- |
| subscriptions_billing_days | Int | -- |
| subscriptions_trial_period | Int | -- |
| default_return_url | String | -- |
| owner_emails_to_notify | String | -- |
| resp_name | String | -- |
| resp_cpf | String | -- |
| can_receive? | Boolean | -- |
| is_verified? | Boolean | -- |
| last_verification_request_feedback | String | -- |

## Withdrawal

> Model responsible for registering sub account withdrawals.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| api_id | String | Withdrawal's API ID |
| sub_account_id | BigInt | Your project's SubAccount Id |
| amount | Float | -- |
| custom_variables | Text (send as has) | -- |
| status | Enumerize | -- |
| feedback | String | -- |

## Transfer

> Model responsible for registering sub accounts transfers.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| api_id | String | Withdrawal's API ID |
| sub_account_id | BigInt | Your project's SubAccount Id |
| receiver | String | Account's API ID |
| amount_cents | Int | -- |
| amount_localized | String | -- |
| custom_variables | Text (send as hash) | -- |

## Household

> Model responsible for registering households.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| sub_account_id | BigInt | Your project's SubAccount Id |
| agency | String | -- |
| account | String | -- |
| account_type | Enumerize | -- |
| bank | Enumerize | -- |
| document | String | -- |
| status | Enumerize | -- |
| feedback | String | -- |
| verification | Boolean | -- |


### Model Methods
  * The models are validated according it's API.
  * Most of the actions are sent to the api before creating a record (those that aren't will be warned).

#### CUSTOMER
  * CREATE
    ```ruby
    JeraPayment::Customer.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you want to link your user model )
    ```ruby
    User.first.create_customer(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    JeraPayment::Customer.first.update(SCHEMA_ATTRIBUTES)
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    JeraPayment::Customer.first.destroy
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.destroy
    ```

#### CREDIT CARD
  * CREATE
    ```ruby
    User.first.customer.credit_cards.create(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    User.first.customer.credit_cards.first.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    User.first.customer.credit_cards.first.destroy
    ```

#### INVOICE
  * CREATE
    ```ruby
    JeraPayment::Invoice.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.customer.invoices.create(SCHEMA_ATTRIBUTES)
    ```
  * CANCEL
    ```ruby
    JeraPayment::Invoice.first.cancel
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.customer.invoices.first.cancel
    ```
  * CAPTURE
    ```ruby
    JeraPayment::Invoice.first.capture
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.customer.invoices.first.capture
    ```
  * REFUND
    ```ruby
    JeraPayment::Invoice.first.refund
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.customer.invoices.first.refund
    ```
  * DUPLICATE
    ```ruby
    JeraPayment::Invoice.first.duplicate(attributes) # attributes is a HASH
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.customer.invoices.first.duplicate(attributes) # attributes is a HASH
    ```
  * SEND EMAIL
    ```ruby
    JeraPayment::Invoice.first.send_email
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.customer.invoices.first.send_email
    ```

#### CHARGE
  * CREATE
    ```ruby
    User.first.customer.invoices.first.create_charge(SCHEMA_ATTRIBUTES)
    ```

#### PLAN
  * CREATE
    ```ruby
    JeraPayment::Plan.create(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    JeraPayment::Plan.first.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    JeraPayment::Plan.first.destroy
    ```
#### SUBSCRIPTION
  * CREATE
    ```ruby
    JeraPayment::Subscription.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.customer.subscriptions.create(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    JeraPayment::Subscription.first.update(SCHEMA_ATTRIBUTES)
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    JeraPayment::Subscription.first.destroy
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.destroy
    ```
  * ACTIVATE
    ```ruby
    JeraPayment::Subscription.first.activate
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.activate
    ```
  * SUSPEND
    ```ruby
    JeraPayment::Subscription.first.suspend
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.suspend
    ```
  * CHANGE PLAN SIMULATION
    ```ruby
    JeraPayment::Subscription.first.change_plan_simulation(plan_identifier)
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.change_plan_simulation(plan_identifier)
    ```
  * CHANGE PLAN
    ```ruby
    JeraPayment::Subscription.first.change_plan(plan_identifier)
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.change_plan(plan_identifier)
    ```
  * ADD CREDITS
    ```ruby
    JeraPayment::Subscription.first.add_credits(credits)
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.add_credits(credits)
    ```
  * REMOVE CREDITS
    ```ruby
    JeraPayment::Subscription.first.remove_credits(credits)
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.customer.subscriptions.first.remove_credits(credits)
    ```
#### SUBACCOUNT
  * CREATE
    ```ruby
    JeraPayment::SubAccount.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.create_sub_account(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    JeraPayment::SubAccount.first.update(SCHEMA_ATTRIBUTES)
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.sub_account.update(SCHEMA_ATTRIBUTES)
    ```
  * VERIFY
    ```ruby
    JeraPayment::SubAccount.first.verify(api_attributes) # This will create the household unless errors.present?
    ```
    OR ( if your customer is linked to a user record )
    ```ruby
    User.first.sub_account.verify(attributes) # This will create the household unless errors.present?
    ```

#### WITHDRAWAL
  * CREATE
    ```ruby
    JeraPayment::Withdrawal.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.sub_account.withdrawals.create(SCHEMA_ATTRIBUTES)
    ```

#### TRANSFER
  * CREATE
    ```ruby
    JeraPayment::Transfer.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.sub_account.transfers.create(SCHEMA_ATTRIBUTES)
    ```

#### HOUSEHOLD
  * CREATE
    ```ruby
    JeraPayment::Household.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your user model )
    ```ruby
    User.first.sub_account.households.create(SCHEMA_ATTRIBUTES)
    ```

### API Methods
  * All the access_token are only filth when using marketplace api token.
  * All arguments passed to methods are directly send to Iugu's API.

#### IUGU

##### CUSTOMER

  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Customer.index(query = nil, access_token = nil) # query and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Customer.show(customer_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Customer.create(body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::Customer.update(customer_api_id, body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::Customer.destroy(customer_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```

##### PAYMENT TOKEN (First part for credit card creation)
* CREATE
  ```ruby
  JeraPayment::Api::Iugu::PaymentToken.create(body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
  ```

##### PAYMENT METHOD (Last part for credit card creation)
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.index(customer_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.show(customer_api_id, payment_method_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.create(customer_api_id, body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.update(customer_api_id, payment_method_api_id, body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.destroy(customer_api_id, payment_method_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```

#### INVOICE
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Invoice.index(query = nil, access_token = nil) # query and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Invoice.show(invoice_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Invoice.create(body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * DUPLICATE
    ```ruby
    JeraPayment::Api::Iugu::Invoice.duplicate(invoice_api_id, body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CAPTURE
    ```ruby
    JeraPayment::Api::Iugu::Invoice.capture(invoice_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CANCEL
    ```ruby
    JeraPayment::Api::Iugu::Invoice.cancel(invoice_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * REFUND
    ```ruby
    JeraPayment::Api::Iugu::Invoice.refund(invoice_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SEND EMAIL
    ```ruby
    JeraPayment::Api::Iugu::Invoice.send_email(invoice_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```

#### CHARGE
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Charge.create(body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```

##### PLAN
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Plan.index(query = nil, access_token = nil) # query and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Plan.show(plan_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Plan.create(body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::Plan.update(plan_api_id, body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::Plan.destroy(plan_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```

##### SUBSCRIPTION
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Subscription.index(query = nil, access_token = nil) # query and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Subscription.show(subscription_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Subscription.create(body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::Subscription.update(subscription_api_id, body, access_token = nil) # body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::Subscription.destroy(subscription_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * ACTIVATE
    ```ruby
    JeraPayment::Api::Iugu::Subscription.activate(subscription_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SUSPEND
    ```ruby
    JeraPayment::Api::Iugu::Subscription.suspend(subscription_api_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CHANGE PLAN SIMULATION
    ```ruby
    JeraPayment::Api::Iugu::Subscription.change_plan_simulation(subscription_api_id, plan_identifier, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * CHANGE PLAN
    ```ruby
    JeraPayment::Api::Iugu::Subscription.change_plan(subscription_api_id, plan_identifier, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * ADD CREDITS
    ```ruby
    JeraPayment::Api::Iugu::Subscription.add_credits(subscription_api_id, body, access_token = nil) #body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * REMOVE CREDITS
    ```ruby
    JeraPayment::Api::Iugu::Subscription.remove_credits(subscription_api_id, body, access_token = nil) #body is HASH and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```

##### SUBACCOUNT
  * LIST ACCOUNTS
    ```ruby
    JeraPayment::Api::Iugu::SubAccount.list_accounts(query = nil, access_token = nil) # query and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::SubAccount.show(sub_account_account_id, access_token) # access_token is live_api_token/test_api_token
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::SubAccount.create(body) # body is HASH
    ```
  * VERIFY
    ```ruby
    JeraPayment::Api::Iugu::SubAccount.verify(sub_account_account_id, body, access_token) # body is HASH and access_token is user_token
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::SubAccount.update(sub_account_account_id, access_token = nil) # access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```

##### WITHDRAWAL
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Withdrawal.index(query = nil, access_token = nil) # query and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Withdrawal.show(withdrawal_api_id, access_token = nil) # access_token can be nil or live_api_token/test_api_token
    ```
  * REQUEST WITHDRAWAL
    ```ruby
    JeraPayment::Api::Iugu::Withdrawal.request_withdrawal(sub_account_account_id, body, access_token = nil) # body is HASH and access_token can be nil or live_api_token/test_api_token
    ```

##### TRANSFER
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Transfer.index(query = nil, access_token = nil) # query and access_token can be nil or sub_account.live_api_token/sub_account.test_api_token
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Transfer.show(transfers_api_id, access_token = nil) # access_token can be nil or live_api_token/test_api_token
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Transfer.create(body, access_token = nil) # body is HASH and access_token can be nil or live_api_token/test_api_token
    ```

##### HOUSEHOLD
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Household.create(body, access_token = nil) # body is HASH and access_token can be nil or live_api_token/test_api_token
    ```
