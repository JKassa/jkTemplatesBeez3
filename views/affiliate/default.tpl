{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'bootstrap.tooltip' | jhtml }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}

<!-- Link -->
<p class="text-center">
	<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_LINK' }}:</strong><br>
	<code>{{ link }}</code>
</p>

<!--Widgets-->
<div class="items-row cols-3">
	{% if aff_income %}
	<div class="item column-1">
		<div class="article-info text-center">
			<h3>
				{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TRANSACTIONS' }}
				<span class="badge">{{ aff_items | size }}</span>
			</h3>
			<p>
				{% for inc in aff_income %}
				{{ inc.sum }}{{ inc.currency }}<br>
				{% endfor %}
			</p>
		</div>
	</div>
	{% endif %}
	{% if user_cash %}
	<div class="item column-2">
		<div class="article-info text-center">
			<h3>
				{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TO_PAYMENT' }}
			</h3>
			<p>
				{% for cash in user_cash %}
				{% if cash.available %}
				{{ cash.sum }}{{ cash.currency }}<br>
				{% else %}
				0{{ cash.currency }}
				<small class="text-muted">({{ cash.sum }}{{ cash.currency }})</small><br>
				{% endif %}
				{% endfor %}
			</p>
		</div>
	</div>
	{% endif %}
	{% if pay_total %}
	<div class="item column-3">
		<div class="article-info text-center">
			<h3>
				{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_PAYMENTS' }}
				<span class="badge">{{ pay_items | size }}</span>
			</h3>
			<p>
				{% for total in pay_total %}
				{{ total.sum }}{{ total.currency }}<br>
				{% endfor %}
			</p>
		</div>
	</div>
	{% endif %}
</div>

{{ 'sliders.start' | jhtml: 'affiliateAccordian' }}
	{% if aff_items %}
	<!--Transactions-->
	{% assign title_slide = '_' | jtext: 'COM_JKASSA_AFFILIATE_TRANSACTIONS' %}
	{{ 'sliders.panel' | jhtml: title_slide, 'transactions' }}
	<table style="margin-top: 10px;">
		<thead>
			<tr>
				<th>{{ '_' | jtext: 'JDATE' }}</th>
				<th>{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}</th>
				<th>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_INCOME' }}</th>
			</tr>
		</thead>
		<tbody>
			{% for aff in aff_items %}
			<tr>
				<td>{{ 'date' | jhtml: aff.modified, 'DATE_FORMAT_LC2' }}</td>
				<td>
					{% if aff.type == 1 %}
						{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TYPE_1' }}
					{% else %}
						{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TYPE_2' }}
					{% endif %}
				</td>
				<td>{{ aff.sum }}{{ aff.currency }}</td>
			</tr>
			{% endfor %}
		</tbody>
	</table>
	{% endif %}
	{% if user_cash %}
	<!--Withdrawal of funds-->
	{% assign title_slide = '_' | jtext: 'COM_JKASSA_AFFILIATE_WITHDRAWAL' %}
	{{ 'sliders.panel' | jhtml: title_slide, 'withdrawal' }}
    <div style="margin-top: 10px; margin-bottom: 10px;">
		<p>
			<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_ON_YOUR_ACCOUNT' }}:</strong>
			{% for cash in user_cash %}
			<span>{{ cash.sum }}{{ cash.currency }}</span>
			{% endfor %}
			<br>
			<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_AVAILABLE' }}:</strong>
			{% if cash_available %}
			{% for cash in cash_available %}
			<span>{{ cash.sum }}{{ cash.currency }}</span>
			{% endfor %}
			{% else %}
			<span>0</span>
			{% endif %}
		</p>
		{% capture access_note %}
			{% if access_form %}
			<!--You do not have access-->
			<div class="alert alert-block">
				<a data-dismiss="alert" class="close">&times;</a>
				<h4>{{ '_' | jtext: 'JGLOBAL_AUTH_ACCESS_GRANTED'  }}</h4>
				{{ '_' | jtext: 'COM_JKASSA_ORDER_FORM_ACCESS' }}
			</div>
			{% endif %}
		{% endcapture %}
		{{ access_note }}
		<!--Paydata-->
		{% if paydata %}
		<ul>
			<li>
				<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_OUTPUT' }}:</strong> {{ paydata.name }}
			</li>
			{% for field in paydata.fields %}
			<li>
				{{ 'sprintf' | jtext: 'COM_JKASSA_STRONG_FIELDS', field.label, field.value }}
			</li>
			{% endfor %}
		</ul>
		<a href="javascript:;" onClick="jQuery('#jkAffiliateFormDiv').show(); jQuery(this).hide();" class="button">
			{{ '_' | jtext: 'JGLOBAL_EDIT' }}
		</a>
		{% else %}
		<div class="alert alert-info alert-block">
			{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_NO_OUTPUT' }}
		</div>
		<a href="javascript:;" onClick="jQuery('#jkAffiliateFormDiv').show(); jQuery(this).hide();" class="button">
			{{ '_' | jtext: 'COM_JKASSA_ADD' }}
		</a>
		{% endif %}
		<!--Form-->
		<div id="jkAffiliateFormDiv" style="display: none">
			{{ form }}
		</div>
    </div>
	{% endif %}
	{% if pay_items %}
	<!--Payments-->
	{% assign title_slide = '_' | jtext: 'COM_JKASSA_AFFILIATE_PAYMENTS' %}
	{{ 'sliders.panel' | jhtml: title_slide, 'payments' }}
	<table style="margin-top: 10px;">
		<thead>
			<tr>
				<th>{{ '_' | jtext: 'JDATE' }}</th>
				<th>{{ '_' | jtext: 'COM_JKASSA_COMMENT' }}</th>
				<th>{{ '_' | jtext: 'COM_JKASSA_SUM' }}</th>
			</tr>
		</thead>
		<tbody>
			{% for pay in pay_items %}
			<tr>
				<td>{{ 'date' | jhtml: pay.date, 'DATE_FORMAT_LC2' }}</td>
				<td>{{ pay.comment }}</td>
				<td>{{ pay.sum }}{{ pay.currency }}</td>
			</tr>
			{% endfor %}
		</tbody>
	</table>
	{% endif %}
	{% if banners %}
	<!--Banners-->
	{% assign title_slide = '_' | jtext: 'COM_JKASSA_AFFILIATE_BANNERS' %}
	{{ 'sliders.panel' | jhtml: title_slide, 'banners' }}
	<div style="margin-top: 10px;">
		<p>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_BANNERS_DESC'  }}</p>
		{% for banner in banners %}
		<h4>{{ banner.title }}</h4>
		<div>{{ banner.code }}</div>
		<div style="margin-bottom: 10px;">
			<textarea>{{ banner.code }}</textarea>
		</div>
		{% endfor %}
	</div>
	{% endif %}
{{ 'sliders.end' | jhtml }}

{% if posttext %}
<!--Posttext-->
<div style="margin-top: 10px;">
	{{ posttext }}
</div>
{% endif %}