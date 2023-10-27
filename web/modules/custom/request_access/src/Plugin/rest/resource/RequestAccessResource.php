<?php

namespace Drupal\request_access\Plugin\rest\resource;

use Drupal\request_access\Entity\RequestAccess;
use Drupal\rest\Plugin\ResourceBase;
use Drupal\rest\ResourceResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * Provides a 
 * 
 * @RestResource(
 *   id = "request_access",
 *   label = @Translation("Request access"),
 *   uri_paths = {
 *     "canonical" = "/request_access/request_access/{id}",
 *     "create" = "/request_access/request_access"
 *   }
 * )
 */
class RequestAccessResource extends ResourceBase
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
        $role = $data['role'];


        $accessRequest = RequestAccess::create([
            'name' => $name,
            'surname' => $surname,
            'email' => $email,
            'phone_number' => $phoneNumber,
            'organization' => $organization,
            'interest' => $interest,
            'request' => $request,
            'role' => $role
        ]);
        $accessRequest->save();

        $body = '<html><head></head><body>'
            . $this->t('New Access request').'<br><br>'
            . $this->t('Name').': '.$name.'<br>'
            . $this->t('Surname').': '.$surname.'<br>'
            . $this->t('Email').': '.$email.'<br>'
            . $this->t('PhoneNumber').': '.$phoneNumber.'<br>'
            . $this->t('Organization').': '.$organization.'<br>'
            . $this->t('InterestArea').': '.$interest.'<br>'
            . $this->t('Role').': '.$role.'<br>'
            . $this->t('Request').': '.$request.'<br>'
            .'</body></html>';

        $mailManager = \Drupal::service('plugin.manager.mail');
        $module = 'request_access';
        $key = 'request_access';
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
