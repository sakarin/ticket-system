# == Schema Information
#
# Table name: redactor_assets
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  data_file_name    :string(255)      not null
#  data_content_type :string(255)
#  data_file_size    :integer
#  assetable_id      :integer
#  assetable_type    :string(30)
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class RedactorRails::Document < RedactorRails::Asset
  mount_uploader :data, RedactorRailsDocumentUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
