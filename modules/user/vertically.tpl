{{ 'stylesheet' | jhtml: 'css/style.css' }}
<div class="jkassa jk-user-module {{ class_sfx }}">
	{% if login_form %}
	<!--Login form-->
	{{ login_form }}
	{% endif %}

	{% if avatar %}
	<!--Avatar-->
	<div class="text-center">
		<a href="{{ edit_avatar }}" target="_blank" title="{{ '_' | jtext: 'JGLOBAL_EDIT' }}">
			<img src="{{ avatar }}" alt="{{ user_name }}" />
		</a>
	</div>
	{% endif %}

	<div class="text-center">
		<!--User name-->
        <p style="margin-bottom: 0"><strong>{{ user_name }}</strong></p>
		{% if date_registration %}
		<!--Date registration-->
		<small>{{ date_registration }}</small>
		{% endif %}
	</div>

	{% if edit_url or logout_url %}
	<p class="text-center">
        {% if edit_url %}
        <!--Edit profile-->
        <a class="button" href="{{ edit_url }}" target="_top" title="{{ '_' | jtext: 'MOD_JKASSA_USER_EDIT_PROFILE' }}">
            {{ '_' | jtext: 'JOPTIONS' }}
        </a>
        {% endif %}
        {% if logout_url %}
        <!--Log out-->
        <a class="button" href="{{ logout_url }}" title="{{ '_' | jtext: 'JLOGOUT' }}">
            {{ '_' | jtext: 'JLOGOUT' }}
        </a>
        {% endif %}
	</p>
	{% endif %}

	{% if add_links %}
	<!--Additional links-->
	<ul class="nav menu mod-list">
		{% for link in add_links %}
		<li>
			<a href="{{ link.url }}">
				{{ link.text }}
			</a>
		</li>
		{% endfor %}
	</ul>
	{% endif %}
</div>