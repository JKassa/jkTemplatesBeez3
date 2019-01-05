{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}

<!--Header-->
<h2>{{ title }}</h2>

<!--Desc-->
<p>{{ desc }}</p>

<!--Logo-->
<p style="text-align:center">
	<img src="{{ logo }}" alt="{{ key }}" class="img-polaroid">
</p>

<!--Params-->
<legend>{{ name }}</legend>
<ul class="unstyled">
    {% for param in params %}
    <li>
		<strong>{{ param.name }}:</strong>
		{% if param.code %}<pre>{% endif %}{{ param.value }}{% if param.code %}</pre>
        {% endif %}
	</li>
    {% endfor %}
</ul>

<legend>{{ '_' | jtext: 'COM_JKASSA_TEST_IMITATION_TITLE' }}</legend>
<p>{{ '_' | jtext: 'COM_JKASSA_TEST_IMITATION_DESC' }}</p>

{% assign rowcount = 1 %}

<div class="article-info text-center">
	{% if interaction %} 
	<!--Interaction-->
	<div style="margin-top: 15px;">
		<form action="{{ interaction.action }}" method="{{ interaction.method }}" name="{{ interaction.name }}" target="_blank">
			{% for field in interaction.fields %}
				{% case field.type %}
					{% when 'hidden' %}
					<input type="hidden" name="{{ field.name }}" value="{{ field.default }}">
					{% when 'select' %}
						{% include 'html/forms/field_select' %}
					{% when 'submit' %}
					<input type="submit" class="button" value="{{ field.value }}" title="{{ field.title }}">
				{% endcase %}
			{% endfor %}
		</form>
	</div>
	{% endif %}
    <div class="items-row cols-{{ buttons }}">
        {% if pending %} 
        <!--Pending-->
        <div class="item column-{{ rowcount }}">
			{% assign rowcount = rowcount | plus: 1 %}
            <form action="{{ pending.action }}" method="{{ pending.method }}" name="{{ pending.name }}" target="_blank">
                {% for field in pending.fields %}
					{% case field.type %}
						{% when 'hidden' %}
							<input type="hidden" name="{{ field.name }}" value="{{ field.default }}">
						{% when 'submit' %}
							<input type="submit" class="button" value="{{ field.value }}" title="{{ field.title }}">
					{% endcase %}
                {% endfor %}
            </form>
        </div>
        {% endif %}
        {% if success %} 
        <!--Success-->
        <div class="item column-{{ rowcount }}">
			{% assign rowcount = rowcount | plus: 1 %}
            <form action="{{ success.action }}" method="{{ success.method }}" name="{{ success.name }}" target="_blank">
                {% for field in success.fields %}
					{% case field.type %}
						{% when 'hidden' %}
							<input type="hidden" name="{{ field.name }}" value="{{ field.default }}">
						{% when 'submit' %}
							<input type="submit" class="button" value="{{ field.value }}" title="{{ field.title }}">
					{% endcase %}
                {% endfor %}
            </form>
        </div>
        {% endif %}
        {% if fail %} 
        <!--Fail-->
        <div class="item column-{{ rowcount }}">
            <form action="{{ fail.action }}" method="{{ fail.method }}" name="{{ fail.name }}" target="_blank">
                {% for field in fail.fields %}
					{% case field.type %}
						{% when 'hidden' %}
							<input type="hidden" name="{{ field.name }}" value="{{ field.default }}">
						{% when 'submit' %}
							<input type="submit" class="button" value="{{ field.value }}" title="{{ field.title }}">
					{% endcase %}
                {% endfor %}
            </form>
        </div>
        {% endif %}
	</div>
</div>