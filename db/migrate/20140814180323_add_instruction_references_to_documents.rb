class AddInstructionReferencesToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :instruction, index: true
  end
end
