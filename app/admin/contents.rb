ActiveAdmin.register Content do
  permit_params :name, :url, :view, :good, :comment, :post_time, :playback

  action_item only: :index do
    link_to 'Import post', action: 'import_post'
  end

  collection_action :import_post do
    render 'admin/contents/import_post'
  end

  collection_action :import_post, method: :post do
    post_num = params['post_num']
    result = `python3 /path/to/insert_data.py #{post_num}`
    puts result

    flash.now[:notice] = 'Insert complete!'
    render 'admin/contents/import_post'
  end
end
