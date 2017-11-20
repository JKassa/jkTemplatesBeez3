<div class="block-products mjkblock">
  <ul class="items-row cols-3">
    {% assign rowcount = 0 %}
    {% for product in products %}
      {% assign rowcount = rowcount | plus: 1 %}
      <li itemscope itemtype="http://schema.org/Product" class="item column-{{ rowcount }}">
        <div class="article-info">
          <div style="height: {{ block_height }}px">
            {% if product.image %}
            <div class="product-image" style="text-align: center">
              <a itemprop="url" href="{{ product.url }}" title="{{ product.name }}">
                <img itemprop="image" src="{{ product.image }}" alt="{{ product.alias }}" style="max-height: 75px; max-width: 75px" />
              </a>
            </div>
            {% endif %}
            <div class="caption">
              <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
                <a itemprop="url" href="{{ product.url }}" title="{{ product.name }}">
                  <span itemprop="name">{{ product.name }}</span>
                </a>
              </p>
              {% if product.introtext %}
              <p style="font-size: 11px; line-height: 14px">
                <span itemprop="description">
                  {{ product.introtext | truncateDesc: 35 }}
                </span>
              </p>
              {% endif %}
			  {% if show_stock %}
			    <!--Stock-->
				<div class="text-right">
				  <small>
					{% case product.stock %} 
					{% when 0 %}
					<!--Not available-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK_0' }}
					{% when '-1' %}
					<!--Available-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK_1' }}
					{% when '-2' %}
					<!--Under the order-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK_2' }}
					{% else %}
					<!--Number-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK' }}: {{ product.stock }}
					{% endcase %}
				  </small>
				</div>
			  {% endif %}
              {% if product.cost %}
              <p itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                {% if product.old_cost %}
                <del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
                {% endif %}
                <span class="cost">
                  <meta itemprop="priceCurrency" content="{{ currency.code }}">
                  {% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
                  <span itemprop="price" content="{{ product.cost | costDisplay: options }}">{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
                </span>
              </p>
              {% endif %}
			  {% if show_votes %}
				{% comment %}
					Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
				{% endcomment %}
				{% if reviews_included %}
				  <!--Rating reviews-->
				  <div class="text-right" title="{{ 'plural' | jtext: 'COM_JKASSA_REVIEWS_COUNT', product.rating_count }}">
					{% for i in (1..5) %}
					  {% if product.rating >= i %}
						{{ 'image' | jhtml: 'system/rating_star.png', 'star', '', 1 }}
					  {% else %}
						{{ 'image' | jhtml: 'system/rating_star_blank.png', 'star_blank', '', 1 }}
					  {% endif %}
					{% endfor %}
				  </div>
				{% else %}
				  {% assign votes = product.id | jkcountervotes: product.rating, product.rating_count %}
				  {% if votes %}
				  <!--Voting-->
				  <div class="text-right">
					{{ votes }}
				  </div>
				  {% endif %}
				{% endif %}
			  {% endif %}
              {% if btns %}
				<p>
				  {% if readmore %}
				  <!--More-->
				  <a itemprop="url" class="button" href="{{ product.url }}">
					{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
				  </a>
				  {% endif %}
				  {% if to_cart %}
				  <!--Add to cart-->
				  <a href="#" data-click="to-cart" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="button" title="{{ product.cart_title }}">
					{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
				  </a>
				  {% endif %}
				  {% if to_wishlist %}
				  <!--Add to Wish List-->
				  <a href="#" data-click="to-wishlist" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="button" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
					{{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}
				  </a>
				  {% endif %}
				  {% if to_compare %}
				  <!--Add to compare-->
				  <a href="#" data-click="to-compare" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="button" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
					{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}
				  </a>
				  {% endif %}
				</p>
			  {% endif %}
            </div>
          </div>
        </div>
      </li>
      {% if rowcount == 3 %}{% assign rowcount = 0 %}{% endif %}
    {% endfor %}
  </ul>
</div>