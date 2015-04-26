angular.module('app.challengeApp').controller("ChallengeCtrl", [
  '$scope',
  ($scope)->
    console.log 'ChallengeCtrl running'

    $scope.challengeValue = "Hello angular and rails"

])