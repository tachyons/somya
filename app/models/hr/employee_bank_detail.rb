# == Schema Information
#
# Table name: employee_bank_details
#
#  id            :integer          not null, primary key
#  employee_id   :integer
#  bank_field_id :integer
#  bank_info     :string(255)
#

#Fedena
#Copyright 2011 Foradian Technologies Private Limited
#
#This product includes software developed at
#Project Fedena - http://www.projectfedena.org/
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

class EmployeeBankDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :bank_field

  def archive_employee_bank_detail(archived_employee)
    bank_detail_attributes = self.attributes
    bank_detail_attributes.delete "id"
    bank_detail_attributes["employee_id"] = archived_employee
    self.delete if ArchivedEmployeeBankDetail.create(bank_detail_attributes)
  end
end
