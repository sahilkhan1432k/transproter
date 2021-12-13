require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    avatar: Field::ActiveStorage,
    job_applications: Field::HasMany,
    vehicles: Field::HasMany,
    first_vehicle: Field::BelongsTo.with_options(class_name: "Vehicle", forign_key: 'first_driver_id'),
    second_vehicle: Field::BelongsTo.with_options(class_name: "Vehicle", forign_key: 'second_driver_id'),
    second_driver: Field::HasOne.with_options(class_name: "User", forign_key: 'user_driver_id'),
    first_driver: Field::BelongsTo.with_options(class_name: "User"),
    messages: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    address: Field::String,
    licence_number: Field::String,
    birthday: Field::Date,
    user_type: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    avatar
    email
    first_name
    birthday
    job_applications
    vehicles
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    avatar
    job_applications
    vehicles
    first_vehicle
    second_vehicle
    first_driver
    messages
    id
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    created_at
    updated_at
    first_name
    last_name
    address
    licence_number
    birthday
    user_type
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    job_applications
    vehicles
    first_vehicle
    second_vehicle
    first_driver
    messages
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    first_name
    last_name
    address
    licence_number
    birthday
    user_type
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.first_name} #{user.last_name}"
  end
end
