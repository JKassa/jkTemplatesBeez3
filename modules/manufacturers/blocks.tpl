<div class="mjkblock">
  <ul class="items-row cols-3">
    {% assign rowcount = 0 %}
	{% for manufacturer in manufacturers %}
	    {% assign rowcount = rowcount | plus: 1 %}
		<li class="item column-{{ rowcount }}">
		  <div class="article-info">
			<div style="height: {{ block_height }}px">
			  {% if manufacturer.thumbnail %}
			  <div class="manufacturer-thumbnail" style="text-align: center">
				<a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
				  <img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 75px; max-width: 75px" />
				</a>
			  </div>
			  {% endif %}
			  <div class="caption">
				<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
				  <a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
					{{ manufacturer.name }}
				  </a>
				  {% if products %}
				  <small>({{ 'plural' | jtext: 'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }})</small>
				  {% endif %}
				</div>
				{% if manufacturer.introtext %}
				<div class="m-t-5" style="font-size: 11px; line-height: 14px">
				  {{ manufacturer.introtext | truncateDesc: 35 }}
				</div>
				{% endif %}
			  </div>
			</div>
			<div class="caption">
			  {% if readmore %}
			  <div class="m-t-5">
				<a class="button" href="{{ manufacturer.url }}">
				  {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
				</a>
			  </div>
			  {% endif %}
			</div>
		  </div>
		</li>
	  	{% if rowcount == 3 %}{% assign rowcount = 0 %}{% endif %}
    {% endfor %}
  </ul>
</div>