<?php

namespace Drupal\skit_log_stdout\Logger;

use Drupal\Component\Serialization\Json;
use Drupal\Core\Logger\RfcLoggerTrait;
use Psr\Log\LoggerInterface;
use Drupal\Core\Logger\RfcLogLevel;
use Drupal\Core\Logger\LogMessageParserInterface;

/**
 * This class allows logging to stdout and stderr.
 */
class Stdout implements LoggerInterface {

  use RfcLoggerTrait;

  /**
   * The message's placeholders parser.
   *
   * @var \Drupal\Core\Logger\LogMessageParserInterface
   */
  protected $parser;

  /**
   * Constructs a Stdout object.
   *
   * @param \Drupal\Core\Logger\LogMessageParserInterface $parser
   *   The parser to use when extracting message variables.
   */
  public function __construct(LogMessageParserInterface $parser) {
    $this->parser = $parser;
  }

  /**
   * {@inheritdoc}
   */
  public function log($level, string|\Stringable $message, array $context = []): void {
    global $base_url;

    if (php_sapi_name() === 'cli') {
      return;
    }

    if ($level <= RfcLogLevel::WARNING) {
      $output = fopen('php://stderr', 'w');
    }
    else {
      $output = fopen('php://stdout', 'w');
    }

    $severity = strtoupper(RfcLogLevel::getLevels()[$level]);

    // Populate the message placeholders and then replace them in the message.
    $variables = $this->parser->parseMessagePlaceholders($message, $context);
    $message = empty($variables) ? $message : strtr($message, $variables);

    $entry = Json::encode(
      [
        'severity' => $severity,
        'date' => date('Y-m-d\TH:i:s', $context['timestamp']),
        'type' => $context['channel'],
        'message' => strip_tags($message),
        'base_url' => $base_url,
        'user_id' => $context['uid'],
        'request_uri' => $context['request_uri'],
        'referer' => $context['referer'],
        'ip' => $context['ip'],
        'link' => strip_tags($context['link']),
        'timestamp' => $context['timestamp'],
      ]
    );

    fwrite($output, $entry . "\r\n");
    fclose($output);
  }

}
