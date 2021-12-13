require "administrate/base_dashboard"

class VehicleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    avatar: Field::ActiveStorage,
    user: Field::BelongsTo,
    job_applications: Field::HasMany,
    first_driver: Field::HasOne.with_options(class_name: "User", forign_key: 'first_driver_id'),
    second_driver: Field::HasOne.with_options(class_name: "User", forign_key: 'second_driver_id'),
    id: Field::Number,
    name: Field::String,
    vehicle_number: Field::String,
    color: Field::String,
    modle: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    avatar
    user
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    avatar
    user
    job_applications
    first_driver
    second_driver
    id
    name
    vehicle_number
    color
    modle
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    materails
    user
    job_applications
    first_driver
    second_driver
    name
    vehicle_number
    color
    modle
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

  # Overwrite this method to customize how vehicles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(vehicle)
  #   "Vehicle ##{vehicle.id}"
  # end
end
