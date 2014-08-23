describe CompanyPolicy do
  subject { CompanyPolicy }

  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:other_user)   { FactoryGirl.build_stubbed :user }
  let (:company)      { FactoryGirl.build_stubbed :company }
  let (:admin)        { FactoryGirl.build_stubbed :user, role: :admin,    company: company }
  let (:manager)      { FactoryGirl.build_stubbed :user, role: :manager,  company: company }
  let (:operator)     { FactoryGirl.build_stubbed :user, role: :operator, company: company }

  permissions :index? do
    it "allows an admin to view the index" do
      expect(subject).to permit(admin)
    end
  end
  
  

  permissions :update? do
    it "allows an admin to make updates" do
      expect(subject).to permit(admin)
    end
    
    it "allows a manager to make updates to operators from the same company" do
      expect(subject).to permit(manager, operator)
    end
  end

  permissions :destroy? do
    it "prevents deleting yourself" do
      expect(subject).not_to permit(current_user, current_user)
    end
    
    it "allows an admin to delete any user" do
      expect(subject).to permit(admin, other_user)
    end
    
    it "allows a manager to delete an operator if they are from the same company" do
      expect(subject).to permit(manager, operator)
    end
  end

end