$Self->{'Ticket::Frontend::ZoomCollectMetaFilters'}->{'IP-Blacklist'} =  {
  'Meta' => {
    'Name' => 'IP-Blacklist',
    'Target' => '_blank',
    'URL' => 'dnsrbl.pl?ip=<MATCH1>',
    'URLPreview' => 'dnsrbl.pl?ip=<MATCH1>',
  },
  'RegExp' => [
    '(\\d{1,3}\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3}))'
  ]
};
