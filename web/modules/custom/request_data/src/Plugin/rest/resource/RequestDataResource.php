<?php

namespace Drupal\request_data\Plugin\rest\resource;

use Drupal\request_data\Entity\RequestData;
use Drupal\rest\Plugin\ResourceBase;
use Drupal\rest\ResourceResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * Provides a Demo Resource
 *
 * @RestResource(
 *   id = "request_data",
 *   label = @Translation("Request data"),
 *   uri_paths = {
 *     "canonical" = "/request_data/request_data/{id}",
 *     "create" = "/request_data/request_data"
 *   }
 * )
 */
class RequestDataResource extends ResourceBase
{
    /**
     * Responds to entity GET requests.
     * @return \Drupal\rest\ResourceResponse
     */
    public function get()
    {
        $response = ['message' => 'Hello, this is a rest service'];
        return new ResourceResponse($response);
    }

    /**
     * Responds to entity POST requests.
     *
     *
     * @return \Drupal\rest\ResourceResponse
     */
    public function post($data)
    {
        $config = \Drupal::config('svksk_base.general_settings');

        //Load Requests notification mail from
        $mailTo = $config->get('requests_notification_email');

        if (!$mailTo) {
            return new ResourceResponse($this->t('Requests notification mail is not configured'), 504);
        }

        $name = $data['name'];
        $surname = $data['surname'];
        $email = $data['email'];
        $phoneNumber = $data['phoneNumber'];
        $organization = $data['organization'];
        $interest = $data['interest'];
        $request = $data['request'];


        $dataRequest = RequestData::create([
            'name' => $name,
            'surname' => $surname,
            'email' => $email,
            'phone_number' => $phoneNumber,
            'organization' => $organization,
            'interest' => $interest,
            'request' => $request,
        ]);
        $dataRequest->save();

        $body = '<html><head></head><body>'
            . $this->t('New Data request').'<br><br>'
            . $this->t('Name').': '.$name.'<br>'
            . $this->t('Surname').': '.$surname.'<br>'
            . $this->t('Email').': '.$email.'<br>'
            . $this->t('PhoneNumber').': '.$phoneNumber.'<br>'
            . $this->t('Organization').': '.$organization.'<br>'
            . $this->t('InterestArea').': '.$interest.'<br>'
            . $this->t('Request').': '.$request.'<br>'
            .'</body></html>';

        $mailManager = \Drupal::service('plugin.manager.mail');
        $module = 'request_data';
        $key = 'request_data';
        $to = $mailTo;
        $params['message'] = $body;
        // $params['subject'] = 'Mail subject';
        $langcode = \Drupal::currentUser()->getPreferredLangcode();
        $send = true;
        $result = $mailManager->mail(
            $module,
            $key,
            $to,
            $langcode,
            $params,
            null,
            $send
        );
        
        return new ResourceResponse($this->t('Request has been noted'), 200);
    }

    /** * {@inheritdoc} */
    public function permissions()
    {
        return [];
    }
}
