class AddAasmToJobapplication < ActiveRecord::Migration[6.1]
  def self.up
    add_column :job_applications, :aasm_state, :string
  end

  def self.down
    remove_column :job_applications, :aasm_state
  end
end
