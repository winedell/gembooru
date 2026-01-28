module ApplicationHelper
    USER_DATA_ATTRIBUTES = %I[
      id name level level_string theme comment_threshold default_image_size time_zone per_page
    ] + User::ACTIVE_BOOLEAN_ATTRIBUTES + User::Roles.map { |role| :"is_#{role}?" }

    COOKIE_DATA_ATTRIBUTES = %i[
      news-tickler hide_upgrade_account_notice hide_verify_account_notice
      hide_dmail_notice dab show-relationship-previews post_preview_size
      post_preview_show_votes
    ]

    def listing_type(*fields, member_check: true, types: [ :revert, :standard ])
      (fields.reduce(false) { |acc, field| acc || params.dig(:search, field).present? } && (!member_check || CurrentUser.is_member?) ? types[0] : types[1])
    end

    def diff_list_html(this_list, other_list, ul_class: [ "diff-list" ], li_class: [], show_unchanged: true)
      diff = SetDiff.new(this_list, other_list)
      render "diff_list", diff: diff, ul_class: ul_class, li_class: li_class, show_unchanged: show_unchanged
    end

    def diff_name_html(this_name, other_name)
      DiffBuilder.new(this_name, other_name, /./).build
    end
end
