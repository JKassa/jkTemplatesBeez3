{% comment %}
	Connect CSS and JavaScript to the header of the document
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

{% if heading %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% endif %}

<!--Name-->
<h2>
  {{ name }}
  <small>({{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', products_quantity }})</small>
</h2>

<!--Image-->
<div>
  <img {{ logo | img_exists: '400x120' }} alt="{{ alias }}">
</div>

{% comment %}
    Connecting voting plugin.
    See: Plugin Manager: Plugins -> jkvotes.
{% endcomment %}
{% assign votes = id | jkvotes: rating, rating_count %}
{% if votes %}
<!--Rating-->
<div class="text-right">
  {{ votes }}
</div>
{% endif %}

<!--Layout products-->
{{ products }}

{% if fulltext %}
<!--Fulltext-->
<div>
  {{ fulltext }}
</div>
{% endif %}

{% if contacts %}
<!--Contacts-->
<div>
  <strong>
    {{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_CONTACTS' }}
  </strong>
  <ul>
    {% if contacts.url %}
    <!--homepage-->
    <li title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_HOMEPAGE' }}">
      <a href="{{ contacts.url }}" target="_blank">{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_HOMEPAGE' }}</a>
    </li>
    {% endif %}
    {% if contacts.email %}
    <!--email-->
    <li title="{{ '_' | jtext: 'JGLOBAL_EMAIL' }}">
      <a href="mailto:{{ contacts.email }}">{{ contacts.email }}</a>
    </li>
    {% endif %}
    {% if contacts.support %}
    <!--support-->
    <li title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_SUPPORT' }}">
      <a href="{{ contacts.support }}" target="_blank">{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_SUPPORT' }}</a>
    </li>
    {% endif %}
    {% if contacts.phone %}
    <!--phone-->
    <li title="{{ '_' | jtext: 'COM_JKASSA_PHONE' }}">
      {{ contacts.phone }}
    </li>
    {% endif %}
    {% if contacts.fax %}
    <!--fax-->
    <li title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_FAX' }}">
      {{ contacts.fax }}
    </li>
    {% endif %}
  </ul>
</div>
{% endif %}

{% comment %}
    Connecting social plugin.
    See: Plugin Manager: Plugins -> jksocial.
{% endcomment %}
{% assign social = id | jksocial: name, logo, metadesc, return_url %}
{% if social %}
{{ social }}
{% endif %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ id | jkcomments: name }}

<!--Print / Email / Edit-->
<ul class="actions">
  {% if print_screen == 0 %}
    <li class="print-icon">
      {{ print_icon }}
    </li>
    <li class="email-icon">
      {{ email_icon }}
    </li>
    {% if edit_icon %}
    <li class="edit-icon">
      {{ edit_icon }}
    </li>
    {% endif %}
  {% else %}
    <li class="print-icon" style="position: fixed; right: 10px; top: 10px">
      {{ print_screen }}
    </li>
  {% endif %}
</ul>

<!--Details-->
<dl class="article-info">
  <dt class="article-info-term">Details</dt>
  <dd itemprop="author" itemscope itemtype="https://schema.org/Person">
    {{ 'sprintf' | jtext: 'COM_JKASSA_WRITTEN_BY', '' }}
    {% if contact_link %}
    <a href="{{ contact_link }}"><i itemprop="name">{{ author }}</i></a>
    {% else %}
    <i itemprop="name">{{ author }}</i>
    {% endif %}
  </dd>
  <dd>
    <time datetime="{{ 'date' | jhtml: publish, 'c' }}" itemprop="datePublished">
      {% assign date_publish = 'date' | jhtml: publish, 'DATE_FORMAT_LC2' %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_PUBLISHED_DATE_ON', date_publish }}
    </time>
  </dd>
  <dd>
    <time datetime="{{ 'date' | jhtml: created, 'c' }}" itemprop="dateCreated">
      {% assign date_created = 'date' | jhtml: created, 'DATE_FORMAT_LC2' %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_CREATED_DATE_ON', date_created }}
    </time>
  </dd>
  <dd>
    <time datetime="{{ 'date' | jhtml: modified, 'c' }}" itemprop="dateModified">
      {% assign date_modified = 'date' | jhtml: modified, 'DATE_FORMAT_LC2' %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_LAST_UPDATED', date_modified }}
    </time>
  </dd>
</dl>

{% if pagination %}
<!--Pagination-->
<ul class="pager pagenav">
  {% if pagination.prev %}
  <li class="previous">
    <a href="{{ pagination.prev }}" rel="prev">
      {{ '_' | jtext: 'JPREV' }}
    </a>
  </li>
  {% endif %}
  {% if pagination.next %}
  <li class="next">
    <a href="{{ pagination.next }}" rel="next">
      {{ '_' | jtext: 'JNEXT' }}
    </a>
  </li>
  {% endif %}
</ul>
{% endif %}