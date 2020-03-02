{{ 'stylesheet' | jhtml: 'css/style.css' }}
<div class="jkassa jk-user-module {{ class_sfx }}">
	<a href="{{ account_url }}" style="display: block; position: relative; width: 30px; height: 30px; margin-right: -10px;" title="{{ '_' | jtext: 'MOD_JKASSA_USER_ACCOUNT' }}">
		<span style="display: block; margin-top: 5px">
			<img src="{{ icon_image }}" alt="user" />
		</span>
	</a>
</div>